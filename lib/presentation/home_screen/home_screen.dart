import 'package:bookflow/presentation/home_screen/widgets/home_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../../core/utils/color_constant.dart';
import '../account_page_screen/account_page_screen.dart';
import '../library_screen/library_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final List<String> imagePaths = [
  //   ImageConstant.bookCover1,
  //   ImageConstant.bookCover2,
  //   ImageConstant.bookCover3,
  //   ImageConstant.bookCover4,
  //   ImageConstant.bookCover5,
  //   ImageConstant.bookCover6,
  //   ImageConstant.bookCover7,
  //   ImageConstant.bookCover8,
  // ];

  int _currentIndex = 0;

  final List<Widget> _pages = [
    // The first page of the application
    const HomePage(),
    // The second page of the application (LibraryScreen)
    const LibraryScreen(),
    // The third page of the application (ProfileScreen)
    const AccountPageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.easeOutExpo,
        animationDuration: const Duration(milliseconds: 600),
        height: 75,
        backgroundColor: ColorConstant.cyan500,
        items: <Widget>[
          Icon(Icons.home_filled, size: 32, color: ColorConstant.gray700),
          Icon(Icons.auto_stories, size: 32, color: ColorConstant.gray700),
          Icon(Icons.person, size: 32, color: ColorConstant.gray700),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: _pages[_currentIndex],
    );
  }
}
