import 'package:bookflow/core/utils/size_utils.dart';
import 'package:bookflow/presentation/library_screen/logic/library_screen_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/color_constant.dart';
import '../../../theme/app_style.dart';

class SelectCollectionDialog extends StatefulWidget {
  const SelectCollectionDialog({super.key});

  @override
  SelectCollectionDialogState createState() => SelectCollectionDialogState();
}

class SelectCollectionDialogState extends State<SelectCollectionDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double containerHeight = 0;
  final TextEditingController controller = TextEditingController();
  bool showOkButton = false;

  @override
  void initState() {
    super.initState();
    Provider.of<LibraryScreenLogic>(context, listen: false).loadCollections();
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

  @override
  Widget build(BuildContext context) {
    return Consumer<LibraryScreenLogic>(
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
                  height: containerHeight + 85,

                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Choose Collection',
                        style: AppStyle.txtOpenSansBold20(context),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: collectionProvider.collections.length + 1,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              // The first item is the "All Books" option
                              return ListTile(
                                leading: const Icon(Icons.list),
                                title: const Text("All Books"),
                                onTap: () {
                                  Provider.of<LibraryScreenLogic>(context,
                                          listen: false)
                                      .setCurrentCollection('All');
                                  Navigator.pop(context);
                                },
                              );
                            }
                            String collection =
                                collectionProvider.collections[index - 1];
                            return ListTile(
                              leading: const Icon(Icons.list),
                              title: Text(collection),
                              onTap: () {
                                print(
                                    'User chose collection: ${collectionProvider.collections[index - 1]}');

                                collectionProvider
                                    .setCurrentCollection(collection);
                                Navigator.pop(context);
                              },
                            );
                          },
                        ),
                      ),
                      // AnimatedOpacity(
                      //   duration: const Duration(milliseconds: 300),
                      //   opacity: showOkButton ? 1.0 : 0.0,
                      //   child: ElevatedButton(
                      //     onPressed: showOkButton
                      //         ? () {
                      //             Navigator.pop(context);
                      //             // Add your "OK" button functionality here
                      //           }
                      //         : null,
                      //     style: ButtonStyle(
                      //       backgroundColor: MaterialStateProperty.all(
                      //           ColorConstant.cyan500),
                      //       shape: MaterialStateProperty.all(
                      //           RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(
                      //             12), // 12 is the radius value
                      //       )),
                      //     ),
                      //     child: const Text('OK'),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            );
          });
    });
  }
}
