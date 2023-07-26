// import 'package:flutter/material.dart';

// import '../../core/utils/image_constant.dart';
// import '../../core/utils/size_utils.dart';
// import '../../routes/app_routes.dart';
// import '../../theme/app_decoration.dart';
// import '../../theme/app_style.dart';
// import '../../widgets/custom_image_view.dart';

// class SignUpSuccessfulDialog extends StatefulWidget {
//   const SignUpSuccessfulDialog({Key? key})
//       : super(
//           key: key,
//         );

//   @override
//   State<SignUpSuccessfulDialog> createState() => _SignUpSuccessfulDialogState();
// }

// class _SignUpSuccessfulDialogState extends State<SignUpSuccessfulDialog>
//     with SingleTickerProviderStateMixin {
//   late final AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 1, milliseconds: 500),
//       vsync: this,
//     )..repeat();

//     Future.delayed(const Duration(seconds: 6), () {
//       Navigator.pushNamed(context, AppRoutes.welcomeScreen);
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: getHorizontalSize(
//         340,
//       ),
//       padding: getPadding(
//         left: 48,
//         top: 32,
//         right: 48,
//         bottom: 32,
//       ),
//       decoration: AppDecoration.fillWhiteA700.copyWith(
//         borderRadius: BorderRadiusStyle.roundedBorder40,
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           CustomImageView(
//             svgPath: ImageConstant.imgVectorTeal200,
//             height: getVerticalSize(
//               180,
//             ),
//             width: getHorizontalSize(
//               185,
//             ),
//             margin: getMargin(
//               top: 8,
//             ),
//           ),
//           Padding(
//             padding: getPadding(
//               top: 37,
//             ),
//             child: Text(
//               "Sign Up Successful!",
//               overflow: TextOverflow.ellipsis,
//               textAlign: TextAlign.left,
//               style: AppStyle.txtOpenSansBold24,
//             ),
//           ),
//           Container(
//             width: getHorizontalSize(
//               242,
//             ),
//             margin: getMargin(
//               top: 16,
//             ),
//             child: Text(
//               "Your account has been created.\nPlease wait a moment, we are preparing for you...",
//               maxLines: null,
//               textAlign: TextAlign.center,
//               style: AppStyle.txtOpenSansRegular16.copyWith(
//                 letterSpacing: getHorizontalSize(
//                   0.2,
//                 ),
//               ),
//             ),
//           ),
//           Padding(padding: getPadding(top: 28)),
//           RotationTransition(
//             turns: _controller,
//             child: CustomImageView(
//               imagePath: ImageConstant.imgVector,
//               height: getSize(
//                 60,
//               ),
//               width: getSize(
//                 60,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';

class SignUpSuccessfulDialog extends StatefulWidget {
  const SignUpSuccessfulDialog({Key? key})
      : super(
          key: key,
        );

  @override
  State<SignUpSuccessfulDialog> createState() => _SignUpSuccessfulDialogState();
}

class _SignUpSuccessfulDialogState extends State<SignUpSuccessfulDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getHorizontalSize(
        340,
      ),
      padding: getPadding(
        all: 32,
      ),
      decoration: AppDecoration.fillWhiteA700.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder40,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: getPadding(
              top: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: getPadding(
                        left: 10,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: getSize(
                              20,
                            ),
                            width: getSize(
                              20,
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstant.teal200,
                              borderRadius: BorderRadius.circular(
                                getHorizontalSize(
                                  10,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: getSize(
                              5,
                            ),
                            width: getSize(
                              5,
                            ),
                            margin: getMargin(
                              left: 74,
                              top: 2,
                              bottom: 13,
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstant.teal200,
                              borderRadius: BorderRadius.circular(
                                getHorizontalSize(
                                  2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: getSize(
                            2,
                          ),
                          width: getSize(
                            2,
                          ),
                          margin: getMargin(
                            top: 54,
                            bottom: 87,
                          ),
                          decoration: BoxDecoration(
                            color: ColorConstant.teal200,
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                1,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: getSize(
                            10,
                          ),
                          width: getSize(
                            10,
                          ),
                          margin: getMargin(
                            left: 3,
                            top: 108,
                            bottom: 25,
                          ),
                          decoration: BoxDecoration(
                            color: ColorConstant.teal200,
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                5,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: getSize(
                            143,
                          ),
                          width: getSize(
                            143,
                          ),
                          margin: getMargin(
                            left: 9,
                          ),
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  elevation: 0,
                                  margin: const EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder70,
                                  ),
                                  child: Container(
                                    height: getSize(
                                      141,
                                    ),
                                    width: getSize(
                                      141,
                                    ),
                                    padding: getPadding(
                                      all: 45,
                                    ),
                                    decoration: AppDecoration
                                        .gradientCyan700Teal300
                                        .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder70,
                                    ),
                                    child: Stack(
                                      children: [
                                        CustomImageView(
                                          svgPath: ImageConstant.successLogo,
                                          height: getSize(
                                            49,
                                          ),
                                          width: getSize(
                                            49,
                                          ),
                                          alignment: Alignment.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  height: getSize(
                                    5,
                                  ),
                                  width: getSize(
                                    5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorConstant.teal200,
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: getSize(
                          2,
                        ),
                        width: getSize(
                          2,
                        ),
                        margin: getMargin(
                          top: 7,
                          right: 45,
                        ),
                        decoration: BoxDecoration(
                          color: ColorConstant.teal200,
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: getSize(
                        7,
                      ),
                      width: getSize(
                        7,
                      ),
                      margin: getMargin(
                        left: 59,
                        top: 1,
                      ),
                      decoration: BoxDecoration(
                        color: ColorConstant.teal200,
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(
                            3,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: getPadding(
                    top: 20,
                    bottom: 67,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.centerRight,
                          child: Transform.scale(
                            scale: _animation.value,
                            child: Container(
                              height: getSize(
                                15,
                              ),
                              width: getSize(
                                15,
                              ),
                              decoration: BoxDecoration(
                                color: ColorConstant.teal200,
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(
                                    7,
                                  ),
                                ),
                              ),
                            ),
                          )),
                      Container(
                        height: getSize(
                          5,
                        ),
                        width: getSize(
                          5,
                        ),
                        margin: getMargin(
                          top: 73,
                        ),
                        decoration: BoxDecoration(
                          color: ColorConstant.teal200,
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: getHorizontalSize(
              186,
            ),
            margin: getMargin(
              top: 35,
            ),
            child: Text(
              "Your account has been created!",
              maxLines: null,
              textAlign: TextAlign.center,
              style: AppStyle.txtOpenSansBold24(context),
            ),
          ),
          Container(
            width: getHorizontalSize(
              188,
            ),
            margin: getMargin(
              top: 19,
            ),
            child: Text(
              "You can move to the main screen now.",
              maxLines: null,
              textAlign: TextAlign.center,
              style: AppStyle.txtOpenSansRegular16(context),
            ),
          ),
          CustomButton(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.homeScreen);
            },
            height: getVerticalSize(
              58,
            ),
            text: "Go to Home",
            margin: getMargin(
              top: 28,
            ),
            variant: ButtonVariant.fillCyan700,
          ),
        ],
      ),
    );
  }
}
