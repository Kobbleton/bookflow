import 'package:bookflow/presentation/widgets/custom_image_view.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/countries_list.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_style.dart';
import '../widgets/custom_drop_down.dart';
import '../settings_personal_info_screen/widgets/listformtitle_item_widget.dart';
import 'package:flutter/material.dart';

class SettingsPersonalInfoScreen extends StatelessWidget {
  const SettingsPersonalInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorConstant.whiteA700,
      appBar: const CustomSettingsAppBar(),
      body: SizedBox(
        width: size.width,
        child: SingleChildScrollView(
          padding: getPadding(top: 20),
          child: Padding(
            padding: getPadding(left: 24, right: 24, bottom: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.robotAvatar,
                  height: getSize(120),
                  width: getSize(120),
                  radius: BorderRadius.circular(
                    getHorizontalSize(60),
                  ),
                ),
                Padding(
                  padding: getPadding(top: 24),
                  child: Divider(
                      height: getVerticalSize(1),
                      thickness: getVerticalSize(1),
                      color: ColorConstant.gray200),
                ),
                Padding(
                    padding: getPadding(top: 23),
                    child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: getVerticalSize(40),
                          );
                        },
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return const ListformtitleItemWidget();
                        })),
                Padding(
                  padding: getPadding(top: 39),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Date of Birth",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtOpenSansBold16(context),
                      ),
                      Padding(
                        padding: getPadding(top: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("12/27/1995",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtOpenSansBold20(context),),
                            CustomImageView(
                                svgPath: ImageConstant.imgCalendar,
                                height: getSize(28),
                                width: getSize(28))
                          ],
                        ),
                      ),
                      Padding(
                        padding: getPadding(top: 9),
                        child: Divider(
                            height: getVerticalSize(1),
                            thickness: getVerticalSize(1),
                            color: ColorConstant.cyan500),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(top: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Street Address",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtOpenSansBold16(context),
                      ),
                      Padding(
                        padding: getPadding(top: 20),
                        child: Text("3517 W. Gray Street, New York",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtOpenSansBold20(context),),
                      ),
                      Padding(
                        padding: getPadding(top: 7),
                        child: Divider(
                            height: getVerticalSize(1),
                            thickness: getVerticalSize(1),
                            color: ColorConstant.cyan500),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(top: 42),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Country",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtOpenSansBold16(context),
                      ),
                      DropdownField(
                        hintText: 'Select Country',
                        iconPath: ImageConstant.imgArrowdown,
                        dropdownItems: countriesList,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapArrowleft(BuildContext context) {
    Navigator.pop(context);
  }
}

class CustomSettingsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomSettingsAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0.0,
      title: const Text(
        'Personal Info',
        style: TextStyle(
          color: Color(0xFF212121),
          fontSize: 24,
          fontFamily: 'Open Sans',
          fontWeight: FontWeight.w700,
        ),
      ),
      titleSpacing: 0.0,
      leading: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..rotateZ(1.57),
        child: const SizedBox(
          width: 15.81,
          height: 19.25,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Container(
            width: 20.04,
            height: 22.10,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://via.placeholder.com/20x22"),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
