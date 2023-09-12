import 'package:flutter/material.dart';
import 'grid_item_widget.dart';

class RecentBooksBlock extends StatelessWidget {
  final List<String> imagePaths;

  const RecentBooksBlock({
    Key? key,
    required this.imagePaths,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // Calculating the main axis extent dynamically based on screen height.
    double mainAxisExtent = height * 0.27; // 30% of screen height

    // Calculating the spacing dynamically based on screen width.
    double spacing = width * 0.05; // 5% of screen width

    return SizedBox(
      width: double.maxFinite,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: height * 0.01, // 3% of screen height
          ),
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: mainAxisExtent,
              crossAxisCount: 2,
              mainAxisSpacing: spacing,
              crossAxisSpacing: spacing,
            ),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 8, // or imagePaths.length if dynamic
            itemBuilder: (context, index) {
              return GridrectanglesiItemWidget(
                imagePath: imagePaths[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
