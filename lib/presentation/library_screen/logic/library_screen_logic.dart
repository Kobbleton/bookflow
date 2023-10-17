import 'dart:convert';
import 'dart:io';
import 'package:bookflow/presentation/library_screen/widgets/success_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../the_loop_screen/the_loop_screen.dart';

class LibraryScreenLogic extends ChangeNotifier {
  List<String> addedBooks = [];
  Map<String, String> bookPaths = {};
  late bool _isGridView = false;

  bool get isGridView => _isGridView;

  set isGridView(bool val) {
    _isGridView = val;
    notifyListeners();
  }

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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isGridView = prefs.getBool('isGridView') ?? true; // default is true

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
