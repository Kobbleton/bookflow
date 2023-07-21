import 'package:flutter/material.dart';
import '../../../core/utils/size_utils.dart';
import 'grid_item_widget.dart';

class RecentBooksBlock extends StatelessWidget {
  final List<String> imagePaths;

  const RecentBooksBlock({
    Key? key,
    required this.imagePaths,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: SingleChildScrollView(
        child: Padding(
          padding: getPadding(
            top: 21,
          ),
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: getVerticalSize(
                277,
              ),
              crossAxisCount: 2,
              mainAxisSpacing: getHorizontalSize(
                22,
              ),
              crossAxisSpacing: getHorizontalSize(
                22,
              ),
            ),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 8,
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
