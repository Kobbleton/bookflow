import 'package:bookflow/core/utils/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:bookflow/presentation/home_screen/widgets/homescreen_appbar.dart';
import 'package:bookflow/presentation/home_screen/widgets/recent_books_widget.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';

class LibraryScreen extends StatelessWidget {
  final List<String> imagePaths = [
    ImageConstant.bookCover1,
    ImageConstant.bookCover2,
    ImageConstant.bookCover3,
    ImageConstant.bookCover4,
    ImageConstant.bookCover5,
    ImageConstant.bookCover6,
    ImageConstant.bookCover7,
    ImageConstant.bookCover8,
  ];

  LibraryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.white,
      appBar: const HomeScreenAppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: getPadding(left: 24, right: 24),
                child: RecentBooksBlock(imagePaths: imagePaths),
              ),
            ),
          ),
          Container(
            height: 20,
            color: ColorConstant.cyan500,
          )
        ],
      ),
    );
  }
}
