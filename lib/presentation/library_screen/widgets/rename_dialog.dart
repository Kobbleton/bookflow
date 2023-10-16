import 'package:flutter/material.dart';

import '../library_screen.dart';

void showRenameDialog(BuildContext context, LibraryScreenLogic logic, String bookName) async {
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
                  logic.renameBook(bookName, controller.text);
                  logic.saveBooks();
                },
                child: const Text('Rename'),
              ),
            ],
          );
    },
  );
}