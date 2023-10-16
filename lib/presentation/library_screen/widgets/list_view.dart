import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../library_screen.dart';
import 'custom_card.dart';
import 'rename_dialog.dart';

class BookListView extends StatelessWidget {
  const BookListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var logic = Provider.of<LibraryScreenLogic>(context);

    return Stack(
      key: key,
      children: [
        ListView.builder(
          itemCount:
              logic.addedBooks.length, // Replace with the length of your list
          itemBuilder: (BuildContext context, int index) {
            String bookName =
                logic.addedBooks[index]; // Replace with your book data

            return Padding(
              padding: getPadding(
                top: height * 0.015, // 1.5% of screen height
                left: width * 0.06, // 6% of screen width
                right: width * 0.05, // 5% of screen width
                bottom: height * 0.015, // 0.5% of screen height
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Book Card on the left
                  CupertinoContextMenu(
                    enableHapticFeedback: true,
                    actions: <Widget>[
                      CupertinoContextMenuAction(
                        trailingIcon: Icons.edit,
                        child: const Text('Rename'),
                        onPressed: () {
                          Navigator.pop(context); // To close the context menu
                          showRenameDialog(context, logic, bookName);
                        },
                      ),
                      CupertinoContextMenuAction(
                        trailingIcon: Icons.delete,
                        isDestructiveAction: true,
                        onPressed: () {
                          Navigator.pop(context); // To close the context menu
                          logic.removeBook(bookName);
                          logic.saveBooks();
                        },
                        child: const Text('Delete'),
                      ),
                    ],
                    child: CustomCard(
                      isGridview: logic.isGridView,
                      imagePath: 'assets/images/90dney_cover.png',
                      text: bookName,
                      onCardTap: (filePath) {
                        // assuming you get filePath from somewhere or it's the same as bookName
                        logic.onBookClicked(bookName, context);
                      },
                    ),
                  ),

                  // Spacing
                  const SizedBox(width: 20),

                  Expanded(
                    child: SizedBox(
                      height: size.height * 0.18,
                      width: size.width * 0.28,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment
                            .start, // Aligns items to the start
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: size.height * 0.012,
                          ),
                          Text(
                            bookName,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.016,
                          ),
                          Text(
                            'Жюль Верн',
                            style: TextStyle(
                              color: Colors.grey.shade300,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Expanded(
                            // Takes up all available space between text and percent indicator
                            child: Container(),
                          ),
                          Container(
                            width: 76,
                            height: 30,
                            decoration: BoxDecoration(
                              color: ColorConstant.dark4,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                "450WPM",
                                style: TextStyle(
                                  color: Colors.white, // Text color
                                  fontWeight:
                                      FontWeight.normal, // Text thickness
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: LinearPercentIndicator(
                                  padding: EdgeInsets.zero,
                                  barRadius: const Radius.circular(16),
                                  lineHeight: 8.0,
                                  percent: 0.284,
                                  backgroundColor: Colors.grey[600],
                                  progressColor: ColorConstant.cyan500,
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              const Text(
                                '28.4%',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.012,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Positioned(
          bottom: 20, // distance from the bottom
          right: 20, // distance from the right
          child: Material(
            color: Colors.transparent, // Button color
            borderRadius: BorderRadius.circular(25),
            child: InkWell(
              borderRadius: BorderRadius.circular(25),
              onTap: () {
                logic.handleTap(context);
              },
              hoverColor: Colors.blue[200], // Hover color change
              child: Lottie.asset(
                'assets/animations/add_button.json',
                width: 84,
                height: 84,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
