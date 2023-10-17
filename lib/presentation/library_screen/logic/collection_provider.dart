import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CollectionProvider with ChangeNotifier {
  List<String> collections = [];
  Map<String, bool> collectionChecklist = {};

  void loadCollections() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    collections = prefs.getStringList('library_collection') ?? [];
    for (var element in collections) {
      collectionChecklist[element] = false;
    }
    notifyListeners();
  }

  void addCollection(String collection) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    collections.add(collection);
    collectionChecklist[collection] = false;
    prefs.setStringList('library_collection', collections);
    notifyListeners();
  }

  void toggleCollection(String collection, bool value) {
    collectionChecklist[collection] = value;
    notifyListeners();
  }

  void removeCollection(String collectionToRemove) async {
    collections.remove(collectionToRemove);
    collectionChecklist.remove(collectionToRemove);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('library_collection', collections);

    notifyListeners();
  }

  bool collectionExists(String name) {
  return collections.contains(name);
}

}
