import 'dart:convert';
import 'dart:io';
import 'package:bookflow/core/utils/image_constant.dart';
import 'package:bookflow/presentation/library_screen/widgets/add_book_button.dart';
import 'package:bookflow/presentation/library_screen/widgets/custom_card.dart';
import 'package:bookflow/presentation/library_screen/widgets/library_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/utils/size_utils.dart';
import '../the_loop_screen/the_loop_screen.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  List<String> addedBooks = [];
  Map<String, String> bookPaths = {};

  @override
  void initState() {
    super.initState();
    loadBooks();
    loadBookPaths();
  }

  Future<void> loadBookPaths() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bookPaths = Map<String, String>.from(
        jsonDecode(prefs.getString('bookPaths') ?? "{}"));
    setState(() {}); // Optional: Call setState to rebuild the widget if needed
  }

  void onBookClicked(String bookName, BuildContext context) async {
    final directory = await getApplicationDocumentsDirectory();
    String fileName = bookPaths[bookName] ?? '';
    String filePath = '${directory.path}/$fileName';

    if (filePath.isNotEmpty) {
      List<String> words = await File(filePath).readAsLines();
      Navigator.push(
          context,
          PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  TheloopScreen(words: words),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              }));
    } else {
      // handle the error: show an alert dialog or something similar
    }
  }

  void handleTap(BuildContext context) async {
    HapticFeedback.mediumImpact(); // First tap
    await Future.delayed(const Duration(milliseconds: 100)); // Wait for 100ms
    HapticFeedback.mediumImpact(); // Second tap
  }

  Future<void> saveBooks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('addedBooks', addedBooks);
  }

  Future<void> loadBooks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      addedBooks = prefs.getStringList('addedBooks') ?? [];
    });
  }

  void onBookAdded(String bookName, String filePath) {
    setState(() {
      bookName = bookName.replaceFirst('.txt', '');
      addedBooks.add(bookName);
      bookPaths[bookName] = filePath;
    });
    saveBooks();
    saveBookPaths();
  }

  Future<void> saveBookPaths() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('bookPaths', jsonEncode(bookPaths));
  }

  void _showRenameDialog(String bookName) async {
    TextEditingController controller = TextEditingController();
    controller.text = bookName; // initialize with old name
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Rename book'),
            content: TextField(
              controller: controller,
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    int index = addedBooks.indexOf(bookName);
                    addedBooks[index] = controller.text.trim();
                  });
                  saveBooks();
                },
                child: const Text('Rename'),
              ),
            ],
          );
        });
  }

  void _showContextMenu(String bookName) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Rename'),
                onTap: () {
                  Navigator.pop(context);
                  _showRenameDialog(bookName);
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    addedBooks.remove(bookName);
                  });
                  saveBooks();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
            const LibraryAppBar(),
            // Padding(
            //   padding: getPadding(
            //     top: height * 0.005, // 1% of screen height
            //     left: width * 0.07, // 7% of screen width
            //   ),
            //   child: SizedBox(
            //     width: double.infinity,
            //     child: Text(
            //       "Library",
            //       overflow: TextOverflow.ellipsis,
            //       textAlign: TextAlign.left,
            //       style: AppStyle.txtOpenSansBold24(context),
            //     ),
            //   ),
            // ),
            Expanded(
              child: SingleChildScrollView(
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
                        spacing: 18, // Gap between adjacent chips
                        runSpacing: 22, // Gap between lines
                        children: <Widget>[
                          AddBookButton(
                            onBookAdded: onBookAdded,
                          ), // Pass the callback),
                          CustomCard(
                            imagePath:
                                Theme.of(context).brightness == Brightness.dark
                                    ? ImageConstant.darkMagicCoverStart
                                    : ImageConstant.magicCover1,
                            text: 'Start here',
                            // onLongPress: () {
                            //   print("Long press detected");
                            //   _showContextMenu('Start here');
                            // },
                            onCardTap: (String) {
                              handleTap;
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
                          spacing: 18, // Gap between adjacent chips
                          runSpacing: 22, // Gap between lines
                          children: <Widget>[
                            CustomCard(
                              imagePath: Theme.of(context).brightness ==
                                      Brightness.dark
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
                              imagePath: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? ImageConstant.darkMagicCoverNew
                                  : ImageConstant.magicCover1,
                              text: 'Whats new',
                              // onLongPress: () {
                              //   print("Long press detected");
                              //   _showContextMenu('Whats new');
                              // },
                              onCardTap: (String) {},
                            ),
                            for (String bookName in addedBooks)
                              CupertinoContextMenu(
                                enableHapticFeedback: true,

                                actions: <Widget>[
                                  CupertinoContextMenuAction(
                                    trailingIcon: Icons.edit,
                                    child: const Text('Rename'),
                                    onPressed: () {
                                      Navigator.pop(
                                          context); // To close the context menu
                                      _showRenameDialog(bookName);
                                    },
                                  ),
                                  CupertinoContextMenuAction(
                                    trailingIcon: Icons.delete,
                                    isDestructiveAction: true,
                                    onPressed: () {
                                      Navigator.pop(
                                          context); // To close the context menu
                                      setState(() {
                                        addedBooks.remove(bookName);
                                      });
                                      saveBooks();
                                    },
                                    child: const Text('Delete'),
                                  ),
                                ],
                                // child:
                                //     Image.asset('assets/images/bookcover1.png'),
                                child: CustomCard(
                                  // onLongPress: () {},
                                  imagePath: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? ImageConstant.darkMagicCoverNew
                                      : ImageConstant.magicCover1,
                                  text: bookName,
                                  onCardTap: (filePath) {
                                    // assuming you get filePath from somewhere or it's the same as bookName
                                    onBookClicked(bookName, context);
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
