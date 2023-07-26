import 'package:bookflow/core/utils/image_constant.dart';
import 'package:bookflow/presentation/home_screen/widgets/homescreen_appbar.dart';
import 'package:bookflow/presentation/library_screen/widgets/add_book_button.dart';
import 'package:bookflow/presentation/library_screen/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_style.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const HomeScreenAppBar(),
              Padding(
                padding: getPadding(
                  top: 10,
                  left: 28,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Library",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtOpenSansBold24(context),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: getPadding(
                    top: 12,
                  ),
                  child: Padding(
                    padding: getPadding(
                      left: 24,
                      right: 21,
                      bottom: 5,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const AddBookButton(),
                            CustomCard(
                              imagePath: ImageConstant.magicCover1,
                              text: 'Start here',
                            )
                          ],
                        ),
                        Padding(
                          padding: getPadding(
                            top: 22,
                            right: 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomCard(
                                imagePath: ImageConstant.magicCover2,
                                text: 'FAQ',
                              ),
                              CustomCard(
                                imagePath: ImageConstant.magicCover3,
                                text: 'Whats new',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: getPadding(
                    bottom: 0,
                  ),
                  child: Container(
                    height: 20,
                    color: ColorConstant.cyan500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
