import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddToCollectionDialog extends StatefulWidget {
  const AddToCollectionDialog({super.key});

  @override
  AddToCollectionDialogState createState() => AddToCollectionDialogState();
}

class AddToCollectionDialogState extends State<AddToCollectionDialog> {
  late List<String> collections;
  final TextEditingController controller = TextEditingController();
  Map<String, bool> collectionChecklist = {};

  @override
  void initState() {
    super.initState();
    _loadCollections();
  }

  _loadCollections() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      collections = prefs.getStringList('collections') ?? [];
      for (var element in collections) {
        collectionChecklist[element] = false;
      }
    });
  }

  _addCollection(String collection) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    collections.add(collection);
    collectionChecklist[collection] = false;
    prefs.setStringList('collections', collections);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            const Text('Choose or Create a Collection'),
            Expanded(
              child: ListView.builder(
                itemCount: collections.length,
                itemBuilder: (context, index) {
                  final collection = collections[index];
                  return CheckboxListTile(
                    title: Text(collection),
                    value: collectionChecklist[collection],
                    onChanged: (bool? value) {
                      setState(() {
                        collectionChecklist[collection] = value!;
                      });
                    },
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("New Collection"),
                      content: TextField(
                        controller: controller,
                        decoration:
                            const InputDecoration(hintText: "Collection Name"),
                      ),
                      actions: [
                        TextButton(
                          child: const Text("Cancel"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        TextButton(
                          child: const Text("Add"),
                          onPressed: () {
                            _addCollection(controller.text);
                            controller.clear();
                            Navigator.pop(context);
                          },
                        )
                      ],
                    );
                  },
                );
              },
              child: const Text('Create New Collection'),
            ),
          ],
        ),
      ),
    );
  }
}
