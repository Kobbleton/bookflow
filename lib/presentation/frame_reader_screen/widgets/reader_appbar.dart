  import 'package:flutter/material.dart';

import '../../../core/utils/color_constant.dart';

PreferredSizeWidget buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(20.0), // specify the height here
      child: Container(color: ColorConstant.dark2),
    );
  }