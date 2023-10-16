import 'package:bookflow/presentation/library_screen/widgets/rename_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../widgets/custom_image_view.dart';
import '../library_screen.dart';
import 'add_book_button.dart';
import 'add_to_collection.dart';
import 'custom_card.dart';

typedef BookChangedCallback = void Function(String bookName);

class LibraryGridView extends StatelessWidget {
  final BookChangedCallback onBookRemoved;
  final void Function(String oldBookName, String newBookName) onRename;

  final LibraryScreenLogic logic;
  final Function(String, String) updateState;

  const LibraryGridView({
    Key? key,
    required this.onBookRemoved,
    required this.onRename,
    required this.logic,
    required this.updateState,
  }) : super(key: key);

  Widget buildGridView(BuildContext context) {
    return SingleChildScrollView(
      key: key,
      padding: getPadding(
        top: height * 0.015, // 1.5% of screen height
      ),
      child: Padding(
        padding: getPadding(
          left: width * 0.06, // 6% of screen width
          right: width * 0.05, // 5% of screen width
          bottom: height * 0.005, // 0.5% of screen height
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Wrap(
              direction: logic.isGridView ? Axis.horizontal : Axis.vertical,
              spacing: 18, // Gap between adjacent chips
              runSpacing: 22, // Gap between lines
              children: <Widget>[
                AddBookButton(
                  handleTap: (context) async {
                    logic.handleTap(context);
                  },
                  onBookAdded: logic.onBookAdded,
                ),
                CustomCard(
                  isGridview: logic.isGridView,

                  imagePath: Theme.of(context).brightness == Brightness.dark
                      ? ImageConstant.darkMagicCoverStart
                      : ImageConstant.magicCover1,
                  text: 'Start here',
                  // onLongPress: () {
                  //   print("Long press detected");
                  //   _showContextMenu('Start here');
                  // },
                  onCardTap: (String) {
                    logic.handleTap;
                  },
                ),
              ],
            ),
            Padding(
              padding: getPadding(
                top: 22,
                right: 0,
              ),
              child: Wrap(
                direction: logic.isGridView ? Axis.horizontal : Axis.vertical,
                spacing: 18, // Gap between adjacent chips
                runSpacing: 22, // Gap between lines
                children: <Widget>[
                  CustomCard(
                    isGridview: logic.isGridView,

                    imagePath: Theme.of(context).brightness == Brightness.dark
                        ? ImageConstant.darkMagicCoverQ
                        : ImageConstant.magicCover1,
                    text: 'FAQ',
                    // onLongPress: () {
                    //   print("Long press detected");
                    //   _showContextMenu('FAQ');
                    // },
                    onCardTap: (String) {},
                  ),
                  CustomCard(
                    isGridview: logic.isGridView,
                    imagePath: Theme.of(context).brightness == Brightness.dark
                        ? ImageConstant.darkMagicCoverNew
                        : ImageConstant.magicCover1,
                    text: 'Whats new',
                    onCardTap: (String) {},
                  ),
                  for (String bookName in logic.addedBooks)
                    CupertinoContextMenu(
                      enableHapticFeedback: true,

                      actions: <Widget>[
                        CupertinoContextMenuAction(
                          child: const Text('Add to Collection'),
                          onPressed: () {
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              builder: (_) => const AddToCollectionDialog(),
                            );
                          },
                        ),
                        CupertinoContextMenuAction(
                          trailingIcon: Icons.edit,
                          child: const Text('Rename'),
                          onPressed: () {
                            Navigator.pop(context); // To close the context menu
                            showRenameDialog(
                                context, updateState, logic, bookName);
                          },
                        ),
                        CupertinoContextMenuAction(
                          trailingIcon: Icons.delete,
                          isDestructiveAction: true,
                          onPressed: () {
                            Navigator.pop(context); // To close the context menu
                            onBookRemoved(bookName);
                            logic.saveBooks();
                          },
                          child: const Text('Delete'),
                        ),
                      ],
                      // child:
                      //     Image.asset('assets/images/bookcover1.png'),
                      child: CustomCard(
                        isGridview: logic.isGridView,
                        // onLongPress: () {},
                        imagePath: 'assets/images/90dney_cover.png',
                        text: bookName,
                        onCardTap: (filePath) {
                          // assuming you get filePath from somewhere or it's the same as bookName
                          logic.onBookClicked(bookName, context);
                        },
                      ),
                    ),
                ],
              ),
            ),
            CustomImageView(
              imagePath: 'assets/images/90dney_cover.png',
              height: size.height * 0.23,
              width: size.width * 0.42,
              radius: BorderRadius.only(
                topLeft: Radius.circular(getHorizontalSize(18)),
                topRight: Radius.circular(getHorizontalSize(18)),
              ),
              alignment: Alignment.topCenter,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildGridView(context);
  }
}
