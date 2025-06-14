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
  // List of added book names
  List<String> addedBooks = [];

  // Map for associating book names with their file paths
  Map<String, String> bookPaths = {};

  // Determines whether the view should be a grid or not. Default is false.
  late bool _isGridView = false;

  // Getter for _isGridView. Exposes the private _isGridView variable.
  bool get isGridView => _isGridView;

  // Holds the current active collection. Default is 'All'.
  String currentCollection = 'All';

  // Holds the list of all collections.
  List<String> collections = [];

  // Maintains a checklist of collections for UI interaction (checked or unchecked).
  Map<String, bool> collectionChecklist = {};

  // Maps a collection to a list of book names that are in that collection.
  Map<String, List<String>> collectionBooks = {};

  // Setter for updating the current collection
  void setCurrentCollection(String collection) {
    currentCollection = collection;

    // Save the last chosen collection
    _saveLastChosenCollection();
    notifyListeners();
  }

  // Asynchronously saves the last chosen collection to SharedPreferences
  Future<void> _saveLastChosenCollection() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('lastChosenCollection', currentCollection);
  }

  // Asynchronously load settings including last chosen collection
  Future<void> loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    currentCollection = prefs.getString('lastChosenCollection') ?? 'All';
    print('Last chosen collection is: $currentCollection'); // debug print
  }

  // Setter for toggling grid view layout
  set isGridView(bool val) {
    _isGridView = val;
    notifyListeners();
  }

  // Asynchronously load paths of added books from SharedPreferences
  Future<void> loadBookPaths() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bookPaths = Map<String, String>.from(
        jsonDecode(prefs.getString('bookPaths') ?? "{}"));
    print('Loaded Books: $bookPaths'); // debug print

    // bookToCollection = Map<String, String>.from(
    //     jsonDecode(prefs.getString('bookToCollection') ?? '{}'));

    // print('Book to Collection Map: $bookToCollection'); // debug print

    notifyListeners();
  }

  // Function called when a book is clicked, for navigation
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

  // Function to handle a tap event (to add a book)
  void handleTap(BuildContext context, String collection) async {
    HapticFeedback.heavyImpact(); // First tap
    await Future.delayed(const Duration(milliseconds: 100)); // Wait for 100ms
    HapticFeedback.heavyImpact(); // Second tap
    Future.delayed(
      Duration.zero,
      () => pickTextFile(
          (bookName, filePath) => onBookAdded(bookName, filePath, collection),
          context),
    );
  }

  // Function to pick a text file using FilePicker
  Future<void> pickTextFile(
      Function(String, String) onBookAdded, BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['txt']);

    if (result != null && result.files.first.path != null) {
      PlatformFile file = result.files.first;
      final tempFile = File(file.path!);

      final appDir = await getApplicationDocumentsDirectory();
      final savedFile = await tempFile.copy('${appDir.path}/${file.name}');

      // Reformat the file content: one word per line
      final content = await savedFile.readAsString();
      final words = content
          .split(RegExp(r'\s+'))
          .where((word) => word.trim().isNotEmpty)
          .toList();
      final formattedContent = words.join('\n');
      await savedFile.writeAsString(formattedContent);

      final cleanBookName = file.name.replaceFirst('.txt', '');

      onBookAdded(cleanBookName, savedFile.path.split('/').last);

      print('Picked file: ${file.name}');
      print('✅ Файл сохранён в директорию приложения: ${savedFile.path}');

      showDialog(
        context: context,
        builder: (BuildContext context) => const BookAddSuccessDialog(),
      );
    } else {
      print('❌ Файл не выбран или путь null');
    }
  }

  // Function to remove a book from the list
  void removeBook(String bookName) {
    addedBooks.remove(bookName);
    saveBooks();
    notifyListeners();
  }

  // Function to rename a book
  void renameBook(String oldName, String newName) {
    int index = addedBooks.indexOf(oldName);
    if (index != -1) {
      addedBooks[index] = newName.trim();
      saveBooks();
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

  // Function to save the added books list
  Future<void> saveBooks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('addedBooks', addedBooks);
    print('Saved Books: $addedBooks');
  }

  // Function to load saved books
  Future<void> loadBooks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    addedBooks = prefs.getStringList('addedBooks') ?? [];
    print('Loaded Books: $addedBooks, SharedPreferences: $prefs');

    // bookIDs = Map<String, String>.from(
    //     jsonDecode(prefs.getString('bookIDs') ?? "{}"));
    notifyListeners(); // Notify all the listening widgets to rebuild
  }

  // Function to add a book and its properties
  String onBookAdded(String bookName, String filePath, String collection) {
    // var uuid = const Uuid();
    // String bookID = uuid.v1();

    bookName = bookName.replaceFirst('.txt', '');

    addedBooks.add(bookName);
    bookPaths[bookName] = filePath;
    print(
        'Added Book: $bookName, Updated addedBooks: $addedBooks, Updated bookPaths: $bookPaths');
    // bookIDs[bookName] = bookID; // Store bookID in the map
    addBookToCollection(collection, bookName);

    saveBooks();
    saveBookPaths();
    // saveBookIDs(); // New function to save bookIDs map

    notifyListeners(); // Notify all the listening widgets to rebuild
    return bookName;
  }

  // Future<void> saveBookIDs() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('bookIDs', jsonEncode(bookIDs));
  // }

  // Function to save the book paths
  Future<void> saveBookPaths() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('bookPaths', jsonEncode(bookPaths));
    print('Saved Book Paths: $bookPaths');
  }

  // Function to get all books in a particular collection
  List<String> getBooksInCollection(String collection) {
    return collectionBooks[collection] ?? [];
  }

  void loadCollections() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    collections = prefs.getStringList('library_collection') ?? [];
    print('Loaded Collections: $collections');

    for (var element in collections) {
      collectionChecklist[element] = false;
    }

    String? collectionBooksStr = prefs.getString('collectionBooks');
    if (collectionBooksStr != null) {
      print('collectionBooksStr: $collectionBooksStr');

      final decoded = jsonDecode(collectionBooksStr);
      if (decoded is Map<String, dynamic>) {
        collectionBooks = decoded
            .map((key, value) => MapEntry(key, List<String>.from(value)));
        print(decoded
            .runtimeType); // Should now print Map<String, List<String>> if everything goes well
      } else {
        print('Error: Unexpected type for collectionBooks');
        print(decoded.runtimeType);
        // Handle the error appropriately
      }
    }

    notifyListeners(); // Notify any listeners of updates
  }

  // Function to add a book to a particular collection
  void addBookToCollection(String collection, String bookName) {
    print('Books in Collection before: ${collectionBooks[collection]}');

    if (collectionBooks[collection] == null) {
      collectionBooks[collection] = [];
    }

    if (bookName.isNotEmpty &&
        !collectionBooks[collection]!.contains(bookName)) {
      collectionBooks[collection]!.add(bookName);
    }
    // saveCollectionBooks();
    print('Books in Collection after: ${collectionBooks[collection]}');
    notifyListeners();
  }

  // void setCurrentCollection(String newCollection) async {
  //   currentCollection = newCollection; // Set the new current collection
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString(
  //       'current_collection', newCollection); // Save the current collection
  //   notifyListeners();
  // }

  // Adds a new collection to the list of collections.
  // Also updates the SharedPreferences to save the updated list.
  void addCollection(String collection) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    collections.add(collection);
    collectionChecklist[collection] = false;
    prefs.setStringList('library_collection', collections);
    print('Saved Collections: $collections');
    notifyListeners();
  }

  // Toggles the checklist value of a given collection.
  void toggleCollection(String collection, bool value) {
    collectionChecklist[collection] = value;
    notifyListeners();
  }

  // Function to save the books inside each collection
  Future<void> saveCollectionBooks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('collectionBooks', jsonEncode(collectionBooks));
  }

  // Function to remove a collection
  void removeCollection(String collectionToRemove) async {
    collections.remove(collectionToRemove);
    collectionChecklist.remove(collectionToRemove);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('library_collection', collections);
    print('Saved Collections: $collections');
    notifyListeners();
  }

  // Function to check if a collection with a given name already exists
  bool collectionExists(String name) {
    return collections.contains(name);
  }

  // Function to check if a book is in a particular collection
  bool isBookInCollection(String collection, String bookName) {
    return collectionBooks[collection]?.contains(bookName) ?? false;
  }

  // Function to remove a book from a particular collection
  void removeBookFromCollection(String collection, String bookName) {
    collectionBooks[collection]?.remove(bookName);
    saveCollectionBooks();
    notifyListeners();
  }
}
