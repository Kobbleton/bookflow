import 'package:flutter/material.dart';
import '../../../core/utils/color_constant.dart';
import '../logic/library_screen_logic.dart';
// Import this if you're using Provider

void showRenameDialog(
    BuildContext context, LibraryScreenLogic logic, String bookName) async {
  TextEditingController controller = TextEditingController();
  controller.text = bookName;

  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: ColorConstant.dark2.withOpacity(
            0.9), // Replace ColorConstant with your actual color constants
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.18,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: ColorConstant.dark2.withOpacity(
                0.95), // Replace ColorConstant with your actual color constants
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  autofocus: true,
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: "Rename book",
                    filled: true,
                    fillColor: ColorConstant
                        .dark1, // Replace ColorConstant with your actual color constants
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text("Cancel"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: ColorConstant
                          .cyan500, // Replace ColorConstant with your actual color constants
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text("Rename"),
                    onPressed: () {
                      Navigator.pop(context);
                      logic.renameBook(bookName, controller.text);
                      logic.saveBooks();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
