import 'package:bookflow/core/utils/size_utils.dart';
import 'package:bookflow/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/color_constant.dart';
import '../logic/collection_provider.dart';

class AddToCollectionDialog extends StatefulWidget {
  const AddToCollectionDialog({super.key});

  @override
  AddToCollectionDialogState createState() => AddToCollectionDialogState();
}

class AddToCollectionDialogState extends State<AddToCollectionDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double containerHeight = 0;
  final TextEditingController controller = TextEditingController();
  bool showOkButton = false;

  @override
  void initState() {
    super.initState();
    Provider.of<CollectionProvider>(context, listen: false).loadCollections();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 350),
      vsync: this,
    )
      ..addListener(() {
        setState(() {
          containerHeight =
              _animation.value * MediaQuery.of(context).size.height * 0.5;
        });
      })
      ..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          await Future.delayed(const Duration(milliseconds: 500));
          setState(() {
            showOkButton = true;
          });
        }
      });

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _showNewCollectionDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            backgroundColor: ColorConstant.dark2.withOpacity(0.9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.18,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: ColorConstant.dark2.withOpacity(0.95),
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
                        hintText: "Collection Name",
                        filled: true,
                        fillColor: ColorConstant.dark1,
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
                          backgroundColor: ColorConstant.cyan500,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text("Add"),
                        onPressed: () {
                          var collectionProvider =
                              Provider.of<CollectionProvider>(context,
                                  listen: false);

                          if (collectionProvider
                              .collectionExists(controller.text)) {
                            // Close the current dialog
                            Navigator.pop(context);

                            // Show a new dialog for the error message
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                backgroundColor:
                                    ColorConstant.dark2.withOpacity(0.95),
                                title: const Text('Error'),
                                content: const Text(
                                    'This collection name already exists.'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            collectionProvider.addCollection(controller.text);
                            controller.clear();
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CollectionProvider>(
        builder: (context, collectionProvider, child) {
      return AnimatedBuilder(
          animation: _animation,
          builder: (context, _) {
            return Transform.scale(
              scale: _animation.value,
              child: Dialog(
                backgroundColor: ColorConstant.dark2.withOpacity(0.95),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: AnimatedContainer(
                  padding: getPadding(all: 16),
                  curve: Curves.easeInOutQuart,
                  duration: const Duration(milliseconds: 550),
                  // height: MediaQuery.of(context).size.height * 0.6,
                  height: containerHeight + 80,

                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Choose or Create new\n Collection',
                                style: AppStyle.txtOpenSansBold20(context),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              // This loop will create the CheckboxListTile for each collection
                              // Use index to create a unique key for each Dismissible
                              for (int index = 0;
                                  index < collectionProvider.collections.length;
                                  index++)
                                Dismissible(
                                  key: ValueKey(collectionProvider.collections[
                                      index]), // Use the actual value for uniqueness

                                  onDismissed: (direction) {
                                    // Implement your deletion logic here
                                    String removedItem =
                                        collectionProvider.collections[index];
                                    collectionProvider
                                        .removeCollection(removedItem);
                                  },
                                  background: Container(
                                    color: Colors.red,
                                    alignment: Alignment.centerLeft,
                                    child: const Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  child: CheckboxListTile(
                                    title: Text(
                                        collectionProvider.collections[index]),
                                    value: collectionProvider
                                            .collectionChecklist[
                                        collectionProvider.collections[index]],
                                    onChanged: (bool? value) {
                                      collectionProvider.toggleCollection(
                                          collectionProvider.collections[index],
                                          value!);
                                    },
                                  ),
                                ),
                              TextButton.icon(
                                onPressed: () =>
                                    _showNewCollectionDialog(context),
                                icon: const Icon(Icons.add),
                                label: const Text(
                                  'Create New Collection',
                                  style: TextStyle(),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        opacity: showOkButton ? 1.0 : 0.0,
                        child: ElevatedButton(
                          onPressed: showOkButton
                              ? () {
                                  Navigator.pop(context);
                                  // Add your "OK" button functionality here
                                }
                              : null,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                ColorConstant.cyan500),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  12), // 12 is the radius value
                            )),
                          ),
                          child: const Text('OK'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
    });
  }
}
