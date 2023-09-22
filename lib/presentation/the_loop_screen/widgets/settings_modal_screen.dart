import 'dart:io';

import 'package:bookflow/core/utils/color_constant.dart';
import 'package:bookflow/core/utils/size_utils.dart';
import 'package:bookflow/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/theloop_theme/theloop_theme_bloc.dart';
import '../../../bloc/theloop_theme/theloop_theme_event.dart';
import '../../../bloc/theloop_theme/theloop_theme_state.dart';

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
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height,
              color: ColorConstant.dark5,
              child: Padding(
                padding: getPadding(top: 16, left: 42),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Themes & Settings',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            // Handle Options button press
                          },
                          child: const Text(
                            'Options',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Icon(Icons.navigate_next)
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      'Themes',
                      style: TextStyle(fontSize: 14, color: Colors.white),
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
                                  "Palatino",
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
                                  "Charter",
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
                                  "SFNSDisplay",
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
                                  "CanelaText",
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
                                  "ProximaNova",
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
                                'ProximaNova',
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
                                'ProximaNova',
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
        width: 80,
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
        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: color,
        minimumSize: const Size(80, 60),
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
