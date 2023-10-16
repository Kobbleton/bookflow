import 'package:bookflow/presentation/library_screen/widgets/grid_view.dart';
import 'package:bookflow/presentation/library_screen/widgets/library_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'library_screen_logic.dart';
import 'widgets/list_view.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  late final LibraryScreenLogic logic;

  @override
  void initState() {
    super.initState();
    logic = Provider.of<LibraryScreenLogic>(context, listen: false);
    logic.loadViewState();
    logic.loadBookPaths();
    logic.loadBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LibraryAppBar(
              isGridView: logic.isGridView,
              toggleView: () {
                setState(() {
                  logic.isGridView = !logic.isGridView;
                });
              },
              saveViewState: () {
                logic.saveViewState();
              },
            ),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: logic.isGridView
                    ? LibraryGridView(
                        key: ValueKey<bool>(logic.isGridView),
                      )
                    : BookListView(
                        key: ValueKey<bool>(logic.isGridView),
                      ),
              ),
            )
                .animate()
                .move(begin: const Offset(0, 16), curve: Curves.easeOutQuad)
                .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad),
          ],
        ),
      ),
    );
  }
}
