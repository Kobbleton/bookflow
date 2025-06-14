import 'dart:io';

import 'package:bookflow/core/utils/color_constant.dart';
import 'package:bookflow/core/utils/size_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../bloc/theloop_theme/theloop_theme_bloc.dart';
import '../../../bloc/theloop_theme/theloop_theme_event.dart';
import '../../../bloc/theloop_theme/theloop_theme_state.dart';
import '../../../theme/fonts.dart';

class SettingsModalScreen {
  final Function(Color) onColorChanged;
  double topPadding = Platform.isIOS ? 40.0 : 0.0;

  SettingsModalScreen({required this.onColorChanged});

  void show(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Settings",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Align(
          alignment: Alignment.centerRight,
          child: Material(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                color: ColorConstant.dark5,
              ),
              width: MediaQuery.of(context).size.width / 2.7,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: getPadding(top: 16, left: 42),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // const Text(
                    //   'Themes & Settings',
                    //   style: TextStyle(
                    //       fontSize: 18,
                    //       color: Colors.white,
                    //       decoration: TextDecoration.underline,
                    //       fontFamily: 'Open Sans',
                    //       fontWeight: FontWeight.bold),
                    // ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            // Show the second modal when Options is clicked
                            showOptionsModal(context);
                          },
                          child: const Text(
                            'Settings',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: getPadding(left: 8),
                          child: LoadingAnimationWidget.threeRotatingDots(
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                        // const Icon(Icons.navigate_next)
                      ],
                    )
                        .animate(onPlay: (controller) => controller.repeat())
                        .shimmer(
                            duration: 3200.ms,
                            color: ColorConstant.cyan300,
                            curve: Curves.easeOutQuad),
                    const SizedBox(height: 8.0),
                    SizedBox(
                      width: Platform.isAndroid
                          ? MediaQuery.of(context).size.width / 3.7
                          : MediaQuery.of(context).size.width / 3.9,
                      child: const Divider(color: Colors.white),
                    ),
                    const Text(
                      'Themes',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Padding(
                      padding: EdgeInsets.only(right: topPadding, left: 0),
                      child: Wrap(
                        spacing: 18.0, // gap between adjacent chips
                        runSpacing: 12.0, // gap between lines
                        alignment: WrapAlignment.start,
                        children: [
                          BlocBuilder<TheloopThemeBloc, TheloopThemeState>(
                            builder: (context, state) {
                              print("Inside BlocBuilder with state: $state");
                              return _buildCircleButton(
                                  context,
                                  ColorConstant.roriginalWhite,
                                  'Aa original',
                                  "Open Sans",
                                  ColorConstant.black,
                                  TheloopThemeSetOriginal());
                            },
                          ),
                          BlocBuilder<TheloopThemeBloc, TheloopThemeState>(
                            builder: (context, state) {
                              print("Inside BlocBuilder with state: $state");
                              return _buildCircleButton(
                                  context,
                                  ColorConstant.dark3,
                                  'Aa quiet',
                                  "Bitter",
                                  ColorConstant.white,
                                  TheloopThemeSetQuiet());
                            },
                          ),
                          BlocBuilder<TheloopThemeBloc, TheloopThemeState>(
                            builder: (context, state) {
                              print("Inside BlocBuilder with state: $state");
                              return _buildCircleButton(
                                  context,
                                  ColorConstant.rpaperLight,
                                  'Aa paper',
                                  "Caveat",
                                  ColorConstant.black,
                                  TheloopThemeSetPaper());
                            },
                          ),
                          BlocBuilder<TheloopThemeBloc, TheloopThemeState>(
                            builder: (context, state) {
                              print("Inside BlocBuilder with state: $state");
                              return _buildCircleButton(
                                  context,
                                  ColorConstant.dark4,
                                  'Aa dark',
                                  "Comfortaa",
                                  ColorConstant.white,
                                  TheloopThemeSetDarkLight());
                            },
                          ),
                          BlocBuilder<TheloopThemeBloc, TheloopThemeState>(
                            builder: (context, state) {
                              print("Inside BlocBuilder with state: $state");
                              return _buildCircleButton(
                                  context,
                                  ColorConstant.rcalmBeige,
                                  'Aa calm',
                                  "Lora",
                                  ColorConstant.black,
                                  TheloopThemeSetCalm());
                            },
                          ),
                          BlocBuilder<TheloopThemeBloc, TheloopThemeState>(
                            builder: (context, state) {
                              print("Inside BlocBuilder with state: $state");
                              return _buildCircleButton(
                                  context,
                                  ColorConstant.rfocusBeigeLight,
                                  'Aa focus',
                                  "Nunito",
                                  ColorConstant.black,
                                  TheloopThemeSetFocus());
                            },
                          ),
                          BlocBuilder<TheloopThemeBloc, TheloopThemeState>(
                            builder: (context, state) {
                              print("Inside BlocBuilder with state: $state");
                              return _buildGradientButton(
                                context,
                                'assets/images/gradient1.png',
                                'Gradient',
                                'Open Sans',
                                Colors.white,
                                SetGradient1(),
                              );
                            },
                          ),
                          BlocBuilder<TheloopThemeBloc, TheloopThemeState>(
                            builder: (context, state) {
                              print("Inside BlocBuilder with state: $state");
                              return _buildGradientButton(
                                context,
                                'assets/images/tunneld1.png',
                                'Tunnel',
                                'Comfortaa',
                                Colors.white,
                                SetTunnel(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(anim1),
          child: child,
        );
      },
    );
  }

  void showOptionsModal(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Options",
      barrierDismissible: true,
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Align(
          alignment: Alignment.centerRight,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            child: Material(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  color: ColorConstant.dark5,
                ),
                width: MediaQuery.of(context).size.width / 2.7,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: getPadding(top: 16, left: 42),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Font Size Selection
                      Padding(
                        padding: getPadding(top: 8, bottom: 12),
                        child: const Text(
                          'Font Size:',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      BlocBuilder<TheloopThemeBloc, TheloopThemeState>(
                        builder: (context, state) {
                          FontSize currentFontSize = state.fontSize;
                          return DefaultTextStyle(
                            style: const TextStyle(
                                color: Colors.white), // Custom Text Color
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    12), // Adjust the corner radius
                                color: ColorConstant
                                    .dark4, // Custom Background Color
                              ),
                              child: CupertinoSlidingSegmentedControl<FontSize>(
                                thumbColor: ColorConstant.cyan500,
                                backgroundColor: ColorConstant.dark4,
                                children: {
                                  FontSize.small: SizedBox(
                                    width: size.width * 0.139, // Custom Width
                                    height: 20, // Custom Height
                                    child: const Center(child: Text("Small")),
                                  ),
                                  FontSize.medium: SizedBox(
                                    width: size.width * 0.139,
                                    height: 20,
                                    child: const Center(child: Text("Medium")),
                                  ),
                                  FontSize.big: SizedBox(
                                    width: size.width * 0.139,
                                    height: 20,
                                    child: const Center(child: Text("Large")),
                                  ),
                                },
                                groupValue:
                                    currentFontSize, // The current selected value
                                onValueChanged: (FontSize? newSize) {
                                  if (newSize != null) {
                                    // Ensure the value is not null before using
                                    // Dispatch the event to update the font size in the Bloc
                                    BlocProvider.of<TheloopThemeBloc>(context)
                                        .add(
                                      SetFontSizeEvent(newFontSize: newSize),
                                    );
                                  }
                                },
                              ),
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: getPadding(bottom: 10),
                      ),
                      SizedBox(
                        width: Platform.isAndroid
                            ? MediaQuery.of(context).size.width / 3.5
                            : MediaQuery.of(context).size.width / 3.8,
                        child: const Divider(color: Colors.white),
                      ),
                      Padding(
                        padding: getPadding(bottom: 10),
                      ),
                      const Text(
                        'Font:',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      const SizedBox(height: 4.0),
                      BlocBuilder<TheloopThemeBloc, TheloopThemeState>(
                        builder: (context, state) {
                          return ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      12.0), // The corner radius, you can adjust it as you like
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  ColorConstant.dark4),
                            ),
                            onPressed: () {
                              showGeneralDialog(
                                context: context,
                                barrierLabel: "Options",
                                barrierDismissible: true,
                                barrierColor: Colors.black.withOpacity(0.5),
                                transitionDuration:
                                    const Duration(milliseconds: 300),
                                pageBuilder: (BuildContext buildContext,
                                    Animation animation,
                                    Animation secondaryAnimation) {
                                  return Align(
                                    alignment: Alignment.centerRight,
                                    child: Material(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                      ),
                                      child: BlocBuilder<TheloopThemeBloc,
                                          TheloopThemeState>(
                                        builder: (context, state) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              color: ColorConstant.dark5,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                bottomLeft: Radius.circular(20),
                                              ),
                                            ),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.7,
                                            child: ListView.builder(
                                              itemCount:
                                                  availableFontNames.length,
                                              itemBuilder: (context, index) {
                                                return ListTile(
                                                  title: Padding(
                                                    padding: getPadding(
                                                        top: 24, left: 0),
                                                    child: Text(
                                                      availableFontNames[index],
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontFamily:
                                                            availableFontNames[
                                                                index],
                                                      ),
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    final theloopThemeBloc =
                                                        BlocProvider.of<
                                                                TheloopThemeBloc>(
                                                            context);
                                                    theloopThemeBloc.add(
                                                      SetFontEvent(
                                                        newFontName:
                                                            availableFontNames[
                                                                index],
                                                      ),
                                                    );
                                                    Navigator.pop(context);
                                                  },
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Column(
                              children: [
                                Text(
                                  state.fontName,
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: state.fontName,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ); // Empty Container or your actual UI
      },
      // transitionBuilder: (context, anim1, anim2, child) {
      //   return SlideTransition(
      //     position: Tween<Offset>(
      //       begin: const Offset(1, 0),
      //       end: Offset.zero,
      //     ).animate(anim1),
      //     child: child,
      //   );
      // },
    );
  }

  Widget _buildGradientButton(
      BuildContext context,
      String imagePath,
      String label,
      String fontName,
      Color textColor,
      TheloopThemeEvent themeEvent) {
    // Changed to TheLoopGradientEvent
    return InkWell(
      onTap: () {
        context
            .read<TheloopThemeBloc>()
            .add(themeEvent); // Changed to TheLoopGradientBloc
        context
            .read<TheloopThemeBloc>()
            .add(SetFontEvent(newFontName: fontName));
        Navigator.pop(context);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        width: size.width * 0.24,
        height: 60,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontFamily: fontName,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCircleButton(BuildContext context, Color color, String label,
      String fontName, Color textColor, TheloopThemeEvent themeEvent) {
    var labelParts = label
        .split(' '); // Assuming the label is two words separated by a space
    return ElevatedButton(
      onPressed: () {
        onColorChanged(color);
        context.read<TheloopThemeBloc>().add(themeEvent);
        context
            .read<TheloopThemeBloc>()
            .add(SetFontEvent(newFontName: fontName));
        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: color,
        minimumSize: Size(
          size.width * 0.24,
          60,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center vertically
        crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
        children: [
          Text(
            labelParts[0], // First part 'Aa'
            style:
                TextStyle(fontSize: 16, fontFamily: fontName, color: textColor),
          ),
          Text(
            labelParts[1], // Second part 'original'
            style:
                TextStyle(fontSize: 10, fontFamily: fontName, color: textColor),
          ),
        ],
      ),
    );
  }
}
