import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import '../../../core/utils/color_constant.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/app_style.dart';
import '../../widgets/custom_image_view.dart';

class AddBookButton extends StatefulWidget {
  const AddBookButton({
    super.key,
    required this.onBookAdded,
  });

  final Function(String, String) onBookAdded;

  @override
  State<AddBookButton> createState() => _AddBookButtonState();
}

class _AddBookButtonState extends State<AddBookButton> {
  Future<void> pickTextFile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['txt']);

    if (result != null) {
      PlatformFile file = result.files.first;
      List<String> lines = await File(file.path!).readAsLines();
      late AnimationController controller;

      // Get the app's local storage directory
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/${file.name}';

      // Copy the file to the app's local storage directory
      final newFile = await File(file.path!).copy(filePath);

      // Notify that a new book has been added.
      widget.onBookAdded(file.name, file.name);

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Wohoo!"),
            content: const Text("Book Added Successfully"),
            actions: [
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop(); // Closes the dialog
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await pickTextFile(context);
      },
      child: SizedBox(
        height: size.height * 0.28,
        width: size.width * 0.42,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusStyle.circleBorder18,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.black.withOpacity(0.5)
                          : Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(2, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: OutlineGradientButton(
                  padding: EdgeInsets.only(
                    left: getHorizontalSize(2),
                    top: getVerticalSize(2),
                    right: getHorizontalSize(2),
                    bottom: getVerticalSize(2),
                  ),
                  strokeWidth: getHorizontalSize(2),
                  gradient: LinearGradient(
                    begin: const Alignment(0.25, 0.2),
                    end: const Alignment(0.4, 0.3),
                    colors: [
                      Colors.orange.shade400,
                      // ColorConstant.cyan100,
                      // ColorConstant.cyan200,
                      // ColorConstant.cyan400,
                      ColorConstant.cyan300,
                    ],
                  ),
                  corners: const Corners(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                  child: Container(
                    padding: getPadding(
                      left: size.width * 0.11,
                      top: size.height * 0.1,
                      right: size.width * 0.1,
                      bottom: size.height * 0.1,
                    ),
                    decoration: AppDecoration.outline.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? ColorConstant.cyan500.withOpacity(0.5)
                          : ColorConstant.cyan500,
                      borderRadius: BorderRadiusStyle.roundedBorder18,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgAdd,
                          height: getSize(42),
                          width: getSize(42),
                          margin: getMargin(
                            top: 3,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 13,
                          ),
                          child: Text(
                            "Add Book",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtOpenSansBold20white(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
