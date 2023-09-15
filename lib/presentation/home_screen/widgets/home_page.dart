import 'package:bookflow/presentation/home_screen/widgets/reading_now.dart';
import 'package:bookflow/presentation/home_screen/widgets/recent_books_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shadowColor: Colors.transparent,
      ),
      body: Column(
        children: [
          const HomeScreenAppBar(),
          Stack(children: [
            Padding(
              padding:
                  getPadding(top: height * 0.02), // 2% of the screen height
              child: const GradientBackgound()
                  .animate()
                  .move(begin: const Offset(-16, 0), curve: Curves.easeOutQuad)
                  .fadeIn(duration: 2200.ms, curve: Curves.easeOutQuad),
            ),
            Padding(
              padding: getPadding(
                  left: width * 0.06, // 6% of the screen width
                  right: width * 0.06, // 6% of the screen width
                  bottom: height * 0.006, // 0.6% of the screen height
                  top: 4),
              child: const ReadingNowBlock()
                  .animate()
                  .move(begin: const Offset(0, -16), curve: Curves.easeOutQuad)
                  .fadeIn(duration: 2200.ms, curve: Curves.easeOutQuad),
            ),
          ]),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: getPadding(
                    left: width * 0.06, // 6% of the screen width
                    right: width * 0.06), // 6% of the screen width
                child: RecentBooksBlock(imagePaths: [
                  ImageConstant.bookCover1,
                  ImageConstant.bookCover2,
                  ImageConstant.bookCover3,
                  ImageConstant.bookCover4,
                  ImageConstant.bookCover5,
                  ImageConstant.bookCover6,
                  ImageConstant.bookCover7,
                  ImageConstant.bookCover8,
                ])
                    .animate()
                    .move(begin: const Offset(0, 16), curve: Curves.easeOutQuad)
                    .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
