import 'dart:io';

import 'package:bookflow/presentation/library_screen/widgets/select_collection_dialog.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../core/utils/color_constant.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_style.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_image_view.dart';

class LibraryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LibraryAppBar({
    Key? key,
    required this.isGridView,
    required this.toggleView,
    required this.saveViewState,
  }) : super(key: key);
  final bool isGridView;
  final VoidCallback toggleView;
  final VoidCallback saveViewState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(
          left: size.width * 0.016,
          top: Platform.isAndroid ? size.height * 0.01 : 0),
      child: CustomAppBar(
        height: size.height * 0.05,
        leadingWidth: size.width * 0.14,
        leading: CustomImageView(
          svgPath: ImageConstant.logoSmall,
          height: getSize(
            28,
          ),
          width: getSize(
            28,
          ),
          radius: BorderRadius.circular(
            getHorizontalSize(
              14,
            ),
          ),
          margin: getMargin(
            left: size.width * 0.02,
            top: 11,
            bottom: 11,
          ),
        ),
        title: Padding(
          padding: getPadding(
            left: 12,
          ),
          child: Text(
            "Library",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtOpenSansBold24(context),
          ),
        ),
        actions: [
          SizedBox(
            width: size.width * 0.62,
            child: IconSlider(
              saveViewState: saveViewState,
              isGridView: isGridView,
              toggleView: toggleView,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(getVerticalSize(70));
}

class IconSlider extends StatefulWidget {
  const IconSlider(
      {Key? key,
      required this.isGridView,
      required this.toggleView,
      required this.saveViewState})
      : super(key: key);

  final bool isGridView;
  final VoidCallback toggleView;
  final VoidCallback saveViewState;

  @override
  IconSliderState createState() => IconSliderState();
}

class IconSliderState extends State<IconSlider> {
  bool showIcons = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(top: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Animated container for the sliding icons
          Flexible(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              curve: Curves.ease,
              width: showIcons ? 220 : 0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(
                    width: 28,
                  ),
                  IconButton(
                    icon: Icon(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? ColorConstant.white
                            : ColorConstant.dark1,
                        Icons.collections_bookmark),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const SelectCollectionDialog();
                        },
                      );
                    },
                  ),
                  const SizedBox(width: 0),
                  IconButton(
                    icon: Icon(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? ColorConstant.white
                            : ColorConstant.dark1,
                        Icons.swap_vert),
                    onPressed: () {
                      //TODO Add your action here
                    },
                  ),
                  const SizedBox(width: 0),
                  IconButton(
                    icon: Icon(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? ColorConstant.white
                            : ColorConstant.dark1,
                        widget.isGridView ? Icons.view_list : Icons.grid_view),
                    onPressed: () {
                      widget.saveViewState();
                      widget.toggleView();
                    },
                  ),
                  IconButton(
                    icon: Icon(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? ColorConstant.white
                            : ColorConstant.dark1,
                        Icons.search),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),

          Stack(
            children: [
              if (showIcons)
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: showIcons ? 1 : 0,
                  child: Padding(
                    padding: getPadding(
                      right: 10,
                    ),
                    child: IconButton(
                      icon: Icon(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? ColorConstant.white
                              : ColorConstant.dark1,
                          Icons.arrow_right),
                      onPressed: () {
                        setState(() {
                          showIcons = !showIcons;
                        });
                      },
                    ),
                  ),
                ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: showIcons ? 0 : 1,
                child: GestureDetector(
                  child: Padding(
                    padding: getPadding(right: 20),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          color: Colors.transparent,
                        ),
                        Transform(
                          transform: Matrix4.identity()
                            ..scale(-1.0, 1.0), // Flip horizontally
                          alignment: Alignment.center,
                          child: LoadingAnimationWidget.halfTriangleDot(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? ColorConstant.white
                                    : ColorConstant.dark1,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      showIcons = !showIcons;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
