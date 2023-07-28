import 'package:bookflow/presentation/home_screen/widgets/reading_now.dart';
import 'package:bookflow/presentation/home_screen/widgets/recent_books_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import 'gradient_card_background.dart';
import 'homescreen_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeScreenAppBar(),
      body: Column(
        children: [
          Stack(children: [
            Padding(
              padding: getPadding(top: 26),
              child: const GradientBackgound(),
            ),
            Padding(
              padding: getPadding(left: 24, right: 24, bottom: 6, top: 0),
              child: const ReadingNowBlock(),
            ),
          ]),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: getPadding(left: 24, right: 24),
                child: RecentBooksBlock(imagePaths: [
                  ImageConstant.bookCover1,
                  ImageConstant.bookCover2,
                  ImageConstant.bookCover3,
                  ImageConstant.bookCover4,
                  ImageConstant.bookCover5,
                  ImageConstant.bookCover6,
                  ImageConstant.bookCover7,
                  ImageConstant.bookCover8,
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
