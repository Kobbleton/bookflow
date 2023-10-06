import 'dart:convert';
import 'dart:io';

import 'package:bookflow/core/utils/color_constant.dart';
import 'package:bookflow/core/utils/image_constant.dart';
import 'package:bookflow/presentation/library_screen/widgets/add_book_button.dart';
import 'package:bookflow/presentation/library_screen/widgets/custom_card.dart';
import 'package:bookflow/presentation/library_screen/widgets/library_appbar.dart';
import 'package:bookflow/presentation/widgets/custom_image_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
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
  bool isGridView = true; // true for GridView, false for ListView

  @override
  void initState() {
    super.initState();
    loadBooks();
    loadBookPaths();
    loadViewState();
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

  // Function to load saved view state
  Future<void> loadViewState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isGridView = prefs.getBool('isGridView') ?? true; // default is true
    });
  }

  // Function to save view state
  Future<void> saveViewState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isGridView', isGridView);
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
            direction: isGridView ? Axis.horizontal : Axis.vertical,
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

  Widget buildGridView() {
    return SingleChildScrollView(
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
              direction: isGridView ? Axis.horizontal : Axis.vertical,
              spacing: 18, // Gap between adjacent chips
              runSpacing: 22, // Gap between lines
              children: <Widget>[
                AddBookButton(
                  onBookAdded: onBookAdded,
                ), // Pass the callback),
                CustomCard(
                  isGridview: isGridView,

                  imagePath: Theme.of(context).brightness == Brightness.dark
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
                direction: isGridView ? Axis.horizontal : Axis.vertical,
                spacing: 18, // Gap between adjacent chips
                runSpacing: 22, // Gap between lines
                children: <Widget>[
                  CustomCard(
                    isGridview: isGridView,

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
                    isGridview: isGridView,

                    imagePath: Theme.of(context).brightness == Brightness.dark
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
                            Navigator.pop(context); // To close the context menu
                            _showRenameDialog(bookName);
                          },
                        ),
                        CupertinoContextMenuAction(
                          trailingIcon: Icons.delete,
                          isDestructiveAction: true,
                          onPressed: () {
                            Navigator.pop(context); // To close the context menu
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
                        isGridview: isGridView,
                        // onLongPress: () {},
                        imagePath: 'assets/images/90dney_cover.png',
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
            CustomImageView(
              imagePath: 'assets/images/90dney_cover.png',
              height: size.height * 0.23,
              width: size.width * 0.42,
              radius: BorderRadius.only(
                topLeft: Radius.circular(getHorizontalSize(18)),
                topRight: Radius.circular(getHorizontalSize(18)),
                // bottomLeft: Radius.circular(getHorizontalSize(0)),
                // bottomRight: Radius.circular(getHorizontalSize(0)),
              ),
              alignment: Alignment.topCenter,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListView() {
    return Stack(
      children: [
        ListView.builder(
          itemCount: addedBooks.length, // Replace with the length of your list
          itemBuilder: (BuildContext context, int index) {
            String bookName = addedBooks[index]; // Replace with your book data

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
                  CustomCard(
                    isGridview: isGridView,
                    imagePath: 'assets/images/90dney_cover.png',
                    text: bookName,
                    onCardTap: (filePath) {
                      // assuming you get filePath from somewhere or it's the same as bookName
                      onBookClicked(bookName, context);
                    },
                  ),

                  // Spacing
                  const SizedBox(width: 20),

                  // Book name and progress indicator on the right
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bookName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        LinearProgressIndicator(
                          value: 0.5, // Use your actual progress value
                          backgroundColor: Colors.grey[200],
                          valueColor: AlwaysStoppedAnimation<Color>(
                              ColorConstant.cyan500),
                        ),
                        const SizedBox(height: 10),
                      ],
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
                // Your button tap action here
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
            LibraryAppBar(
              isGridView: isGridView,
              toggleView: () {
                setState(() {
                  isGridView = !isGridView;
                });
              },
              saveViewState: () {
                saveViewState();
              },
            ),
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
              child: isGridView ? buildGridView() : buildListView(),
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
