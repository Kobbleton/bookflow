import 'package:bookflow/core/utils/color_constant.dart';
import 'package:flutter/material.dart';
import '../../core/utils/image_constant.dart';
import '../home_screen/widgets/homescreen_appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
          const HomeScreenAppBar(
            heading: 'Profile Screen',
            isProfileScreen: true,
            isSettingsScreen: false,
          ),
          Flexible(
            flex: 13,
            child: Container(
              color: Colors.transparent,
              child: Center(
                child: Container(
                  height: height * 0.7,
                  width: width * 0.7,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(ImageConstant.profilePic),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Lower part (3/5 of the screen)
          Flexible(
            flex: 14,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? ColorConstant.dark4
                    : Colors.grey.shade200,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Reading Stats, Personal Info, etc.'),
                    // Add your content here
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
