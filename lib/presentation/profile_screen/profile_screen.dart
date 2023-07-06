import 'package:flutter/material.dart';
import 'package:bookflow/presentation/home_screen/widgets/homescreen_appbar.dart';
import '../../core/utils/color_constant.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.white,
      appBar: const HomeScreenAppBar(),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 20,
          color: ColorConstant.cyan500,
        ),
      ),
    );
  }
}
