import 'package:bookflow/core/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/frame_reader_blocs/frame_reader/frame_reader_bloc.dart';
import '../../bloc/frame_reader_blocs/frame_reader/frame_reader_event.dart';
import '../../bloc/frame_reader_blocs/frame_reader/frame_reader_state.dart';
import 'widgets/frame_reader_utilities.dart';
import 'widgets/reader_appbar.dart';
import 'widgets/reader_body.dart';

class FrameReaderScreen extends StatefulWidget {
  final List<String> words;

  const FrameReaderScreen({Key? key, required this.words}) : super(key: key);

  @override
  State<FrameReaderScreen> createState() => _FrameReaderScreenState();
}

class _FrameReaderScreenState extends State<FrameReaderScreen> {
  final double fontSize = 26.0;
  late PageController _pageController;
  int currentPage = 0;
  late VoidCallback
      _pageControllerListener; // Step 1: Define a reference for the listener

  @override
  void initState() {
    super.initState();
    _initializePageController();
    setPreferredOrientations();
  }

  @override
  void dispose() {
    _pageController.removeListener(
        _pageControllerListener); // Step 2: Remove the listener using the reference
    _disposePageController();
    resetPreferredOrientations();
    super.dispose();
  }

  void _initializePageController() {
    _pageController = PageController();

    _pageControllerListener = () {
      // Step 1: Assign the listener to the reference
      setState(() {
        currentPage = _pageController.page!.toInt();
      });
    };

    _pageController.addListener(
        _pageControllerListener); // Add listener using the reference
  }

  void _disposePageController() => _pageController.dispose();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final readerBloc = BlocProvider.of<ReaderBloc>(context);

        return BlocListener<ReaderBloc, ReaderState>(
          listener: (context, state) {
            // Your listener code here
          },
          child: BlocBuilder<ReaderBloc, ReaderState>(
            builder: (context, state) {
              readerBloc.add(LayoutChangedEvent(
                words: widget.words,
                fontSize: fontSize,
                maxWidth: constraints.maxWidth,
                maxHeight: constraints.maxHeight,
              ));

              return Scaffold(
                backgroundColor: ColorConstant.dark2,
                appBar: buildAppBar(context),
                body: buildBody(
                  pages: state.pages,
                  pageController: _pageController,
                  fontSize: fontSize,
                  currentPage: currentPage,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
