import 'dart:io';

import 'package:bookflow/presentation/home_screen/widgets/home_page.dart';
import 'package:bookflow/presentation/profile_and_settings_screen/profile_and_settings_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../../core/utils/color_constant.dart';

import '../library_screen/library_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    // The first page of the application
    const HomePage(),
    // The second page of the application (LibraryScreen)
    const LibraryScreen(),
    // The third page of the application (ProfileScreen)
    const ProfileAndSettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // Get the screen height and width
    double screenHeight = MediaQuery.of(context).size.height;

    // Calculate navbar and container height based on screen size
    double navBarHeight = screenHeight * 0.08; // 10% of screen height
    double containerPadding = screenHeight * 0.09; // 15% of screen height

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: Platform.isIOS
                    ? containerPadding * 1.03
                    : containerPadding * 0.82,
              ),
              child: _pages[_currentIndex],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: Platform.isIOS
                  ? containerPadding * 1.03
                  : containerPadding * 0.82,
              color: ColorConstant.cyan500,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CurvedNavigationBar(
              color: Theme.of(context).brightness == Brightness.dark
                  ? ColorConstant.dark1
                  : ColorConstant.white,
              animationCurve: Curves.easeOutExpo,
              animationDuration: const Duration(milliseconds: 600),
              height: Platform.isIOS
                  ? navBarHeight * 0.95
                  : navBarHeight * 0.75, // 80% of calculated navBarHeight
              backgroundColor: ColorConstant.cyan500,
              items: <Widget>[
                Icon(
                  Icons.home_filled,
                  size: Platform.isIOS
                      ? navBarHeight * 0.4
                      : navBarHeight * 0.35, // 40% of calculated navBarHeight
                  color: Theme.of(context).brightness == Brightness.dark
                      ? ColorConstant.white
                      : ColorConstant.gray700,
                ),
                Icon(
                  Icons.auto_stories,
                  size:
                      Platform.isIOS ? navBarHeight * 0.4 : navBarHeight * 0.35,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? ColorConstant.white
                      : ColorConstant.gray700,
                ),
                Icon(
                  Icons.person,
                  size:
                      Platform.isIOS ? navBarHeight * 0.4 : navBarHeight * 0.35,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? ColorConstant.white
                      : ColorConstant.gray700,
                ),
              ],
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
