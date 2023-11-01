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
  late VoidCallback _pageControllerListener;

  @override
  void initState() {
    super.initState();
    _initializePageController();
    setPreferredOrientations();
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageControllerListener);
    _disposePageController();
    resetPreferredOrientations();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _dispatchLayoutChangedEvent();
  }

  void _initializePageController() {
    _pageController = PageController();

    _pageControllerListener = () {
      // This listener can be left empty since the currentPage is now managed by the BLoC
    };

    _pageController.addListener(_pageControllerListener);
  }

  void _disposePageController() {
    _pageController.dispose();
  }

  void _dispatchLayoutChangedEvent() {
    final readerBloc = BlocProvider.of<ReaderBloc>(context);
    readerBloc.add(LayoutChangedEvent(
      words: widget.words,
      fontSize: fontSize,
      maxWidth: MediaQuery.of(context).size.width,
      maxHeight: MediaQuery.of(context).size.height,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final readerBloc = BlocProvider.of<ReaderBloc>(context);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return GestureDetector(
          onVerticalDragEnd: (details) {
            // Check if swipe is from top to bottom
            if (details.primaryVelocity! > 0) {
              Navigator.pop(context);
            }
          },
          onTapUp: (details) {
            double screenWidth = MediaQuery.of(context).size.width;

            if (details.localPosition.dx < screenWidth / 2) {
              readerBloc.add(PreviousPageEvent());
            } else {
              readerBloc.add(NextPageEvent());
            }
          },
          child: BlocBuilder<ReaderBloc, ReaderState>(
            builder: (context, state) {
              if (state is PageChangedState) {
                _pageController.jumpToPage(state.currentPage - 1);
              }

              return Scaffold(
                backgroundColor: ColorConstant.dark2,
                appBar: buildAppBar(context),
                body: buildBody(
                  pages: state.pages,
                  pageController: _pageController,
                  fontSize: fontSize,
                  currentPage: state is PageChangedState
                      ? state.currentPage
                      : 0, // Update the current page based on the state
                ),
              );
            },
          ),
        );
      },
    );
  }
}
