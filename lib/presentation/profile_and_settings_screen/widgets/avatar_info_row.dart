import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../repository/auth_repository.dart';
import '../../../theme/app_style.dart';
import '../../widgets/custom_image_view.dart';

class AvatarInfoRow extends StatelessWidget {
  AvatarInfoRow({
    super.key,
  });

  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: ImageConstant.robotAvatar,
          height: getSize(
            56,
          ),
          width: getSize(
            56,
          ),
          radius: BorderRadius.circular(
            getHorizontalSize(
              28,
            ),
          ),
          margin: getMargin(
            bottom: 2,
          ),
        ),
        Padding(
          padding: getPadding(
            left: 20,
            top: 3,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FutureBuilder<String>(
                future:
                    context.read<AuthRepository>().getUserName(user?.uid ?? ''),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Text(
                      snapshot.data ?? 'No Name',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtOpenSansBold20(context),
                    );
                  }
                },
              ),
              Padding(
                padding: getPadding(
                  top: 6,
                ),
                child: Text(
                  user?.email ?? 'No Email',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtOpenSansBold14(context),
                ),
              ),
            ],
          ),
        ),
        //edit icon
        // CustomImageView(
        //   svgPath: ImageConstant.imgEdit,
        //   height: getSize(
        //     24,
        //   ),
        //   width: getSize(
        //     24,
        //   ),
        //   margin: getMargin(
        //     left: 36,
        //     top: 16,
        //     bottom: 18,
        //   ),
        // ),
      ],
    );
  }
}
