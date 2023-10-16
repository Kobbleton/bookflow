import 'dart:convert';
import 'dart:io';
import 'package:bookflow/core/utils/color_constant.dart';
import 'package:bookflow/presentation/library_screen/widgets/custom_card.dart';
import 'package:bookflow/presentation/library_screen/widgets/grid_view.dart';
import 'package:bookflow/presentation/library_screen/widgets/library_appbar.dart';
import 'package:bookflow/presentation/library_screen/widgets/success_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/utils/size_utils.dart';
import '../the_loop_screen/the_loop_screen.dart';
import 'widgets/list_view.dart';
import 'widgets/rename_dialog.dart';

class LibraryScreenLogic extends ChangeNotifier {
  List<String> addedBooks = [];
  Map<String, String> bookPaths = {};
  late bool isGridView = false;

  Future<void> loadBookPaths() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bookPaths = Map<String, String>.from(
        jsonDecode(prefs.getString('bookPaths') ?? "{}"));
    notifyListeners();
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
    HapticFeedback.heavyImpact(); // First tap
    await Future.delayed(const Duration(milliseconds: 100)); // Wait for 100ms
    HapticFeedback.heavyImpact(); // Second tap
    Future.delayed(Duration.zero, () => pickTextFile(onBookAdded, context));
  }

  Future<void> pickTextFile(
      Function(String, String) onBookAdded, BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['txt']);

    if (result != null) {
      PlatformFile file = result.files.first;

      onBookAdded(file.name, file.name);

      showDialog(
        context: context,
        builder: (BuildContext context) => const BookAddSuccessDialog(),
      );
    }
  }

  void removeBook(String bookName) {
    addedBooks.remove(bookName);
    saveBooks(); // assuming this persists addedBooks somewhere
    notifyListeners();
  }

  void renameBook(String oldName, String newName) {
    int index = addedBooks.indexOf(oldName);
    if (index != -1) {
      addedBooks[index] = newName.trim();
      saveBooks(); // Assuming this persists the books
      notifyListeners();
    }
  }

// Function to load saved view state
  Future<void> loadViewState() async {
    print("Loading View State...");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isGridView = prefs.getBool('isGridView') ?? true; // default is true
    print("Is GridView: $isGridView");
    notifyListeners(); // Notify all the listening widgets to rebuild
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

// Function to load saved books
  Future<void> loadBooks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    addedBooks = prefs.getStringList('addedBooks') ?? [];
    notifyListeners(); // Notify all the listening widgets to rebuild
  }

  void onBookAdded(String bookName, String filePath) {
    bookName = bookName.replaceFirst('.txt', '');
    addedBooks.add(bookName);
    bookPaths[bookName] = filePath;
    saveBooks();
    saveBookPaths();
    notifyListeners(); // Notify all the listening widgets to rebuild
  }

  Future<void> saveBookPaths() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('bookPaths', jsonEncode(bookPaths));
  }
}

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

  void updateState(String newBookName, String oldBookName) {
    setState(() {
      int index = logic.addedBooks.indexOf(oldBookName);
      logic.addedBooks[index] = newBookName.trim();
    });
    logic.saveBooks();
  }

  void onBookRemovedCallback(String bookName) {
    setState(() {
      logic.addedBooks.remove(bookName);
    });
    logic.saveBooks();
  }

  void onRenameCallback(String oldBookName, String newBookName) {
    setState(() {
      int index = logic.addedBooks.indexOf(oldBookName);
      logic.addedBooks[index] = newBookName;
    });
    logic.saveBooks();
  }

  @override
  void initState() {
    super.initState();
    logic = Provider.of<LibraryScreenLogic>(context, listen: false);
    logic.loadViewState();
    logic.loadBookPaths();
    logic.loadBooks();
  }

  Widget buildListView({Key? key}) {
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
                          setState(() {
                            logic.addedBooks.remove(bookName);
                          });
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
                duration: const Duration(milliseconds: 100),
                child: logic.isGridView
                    ? LibraryGridView(
                        onBookRemoved: onBookRemovedCallback,
                        onRename: onRenameCallback,
                        logic: logic,
                        updateState: updateState)
                    : BookListView(key: ValueKey<bool>(logic.isGridView)),
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
