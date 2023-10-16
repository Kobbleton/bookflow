import 'package:flutter/material.dart';

import '../library_screen.dart';

void showRenameDialog(BuildContext context, Function setState, LibraryScreenLogic logic, String bookName) async {
  TextEditingController controller = TextEditingController();
  controller.text = bookName;
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
                    int index = logic.addedBooks.indexOf(bookName);
                    logic.addedBooks[index] = controller.text.trim();
                  });
                  logic.saveBooks();
                },
                child: const Text('Rename'),
              ),
            ],
          );
    },
  );
}