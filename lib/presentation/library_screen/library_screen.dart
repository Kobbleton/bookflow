import 'dart:convert';
import 'dart:io';

import 'package:bookflow/core/utils/image_constant.dart';
import 'package:bookflow/presentation/home_screen/widgets/homescreen_appbar.dart';
import 'package:bookflow/presentation/library_screen/widgets/add_book_button.dart';
import 'package:bookflow/presentation/library_screen/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_style.dart';
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
  }

  void onBookClicked(String bookName, BuildContext context) async {
    String filePath = bookPaths[bookName] ?? '';
    if (filePath.isNotEmpty) {
      List<String> words = await File(filePath).readAsLines();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SpritzReadingScreen(words: words),
        ),
      );
    } else {
      // handle the error: show an alert dialog or something similar
    }
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
          child: Container(
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
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const HomeScreenAppBar(),
              Padding(
                padding: getPadding(
                  top: 10,
                  left: 28,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Library",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtOpenSansBold24(context),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: getPadding(
                    top: 12,
                  ),
                  child: Padding(
                    padding: getPadding(
                      left: 24,
                      right: 21,
                      bottom: 5,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AddBookButton(
                              onBookAdded: onBookAdded,
                            ), // Pass the callback),
                            CustomCard(
                              imagePath: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? ImageConstant.darkMagicCoverStart
                                  : ImageConstant.magicCover1,
                              text: 'Start here',
                              onLongPress: () {
                                print("Long press detected");
                                _showContextMenu('Start here');
                              },
                              onCardTap: (String) {},
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
                                onLongPress: () {
                                  print("Long press detected");
                                  _showContextMenu('FAQ');
                                },
                                onCardTap: (String) {},
                              ),
                              CustomCard(
                                imagePath: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? ImageConstant.darkMagicCoverNew
                                    : ImageConstant.magicCover1,
                                text: 'Whats new',
                                onLongPress: () {
                                  print("Long press detected");
                                  _showContextMenu('Whats new');
                                },
                                onCardTap: (String) {},
                              ),
                              for (String bookName in addedBooks)
                                CustomCard(
                                  imagePath: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? ImageConstant.darkMagicCoverNew
                                      : ImageConstant.magicCover1,
                                  text: bookName,
                                  onLongPress: () {
                                    print("Long press detected");
                                    _showContextMenu(bookName);
                                  },
                                  onCardTap: (filePath) {
                                    // assuming you get filePath from somewhere or it's the same as bookName
                                    onBookClicked(bookName, context);
                                  },
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
