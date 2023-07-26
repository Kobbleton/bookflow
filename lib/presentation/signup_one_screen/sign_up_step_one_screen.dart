import 'package:bookflow/bloc/signup/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/countries_list.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../repository/auth_repository.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_input_field_full.dart';
import '../signup_two_screen/sign_up_step_two_screen.dart';
import 'widgets/date_picker_field.dart';

class SignUpStepOneScreen extends StatefulWidget {
  const SignUpStepOneScreen({Key? key}) : super(key: key);

  @override
  State<SignUpStepOneScreen> createState() => _SignUpStepOneScreenState();
}

class _SignUpStepOneScreenState extends State<SignUpStepOneScreen> {
  // Declaring text editing controllers to control the full name and date input fields.
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  String? selectedCountry;

  @override
  void dispose() {
    // Disposing of the fullNameController when the widget is disposed of.
    fullNameController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Creating the UI of the SignUpStepOneScreen inside the SafeArea to ensure no overlap with system UI.
    return Scaffold(
      backgroundColor: ColorConstant.white,
      body: Container(
        width: double.maxFinite,
        padding: getPadding(
          left: 24,
          right: 24,
          top: 40,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Header Row with a back button and a progress indicator.
              Padding(
                padding: getPadding(top: 26, right: 83),
                child: Row(
                  children: [
                    // Back button with custom image.
                    CustomImageView(
                        svgPath: ImageConstant.imgArrowleft,
                        height: getSize(36),
                        width: getSize(36),
                        onTap: () {
                          onTapImgArrowleft(context);
                        }),
                    // Progress indicator to show the progress of the signup process.
                    Expanded(
                      child: Padding(
                        padding: getPadding(left: 56, top: 8, bottom: 8),
                        child: Container(
                          height: getVerticalSize(12),
                          width: getHorizontalSize(216),
                          decoration: BoxDecoration(
                            color: ColorConstant.gray200,
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(6),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(6),
                            ),
                            child: LinearProgressIndicator(
                              value: 0.5,
                              backgroundColor: ColorConstant.gray200,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  ColorConstant.cyan500),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // Title text.
              Container(
                width: getHorizontalSize(352),
                margin: getMargin(top: 38, right: 30),
                child: Text("Let's Complete Your Profile 📋",
                    maxLines: null,
                    textAlign: TextAlign.center,
                    style: AppStyle.txtOpenSansBold32(context),),
              ),
              // Subtitle text.
              Container(
                width: getHorizontalSize(376),
                margin: getMargin(top: 13, right: 5),
                child: Text(
                  "Don't worry, only you can see your personal data. No one else will be able to see it.",
                  maxLines: null,
                  textAlign: TextAlign.center,
                  style: AppStyle.txtOpenSansRegular18(context),
                ),
              ),
              // User profile image with an edit icon on the bottom right corner.
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: getSize(100),
                  width: getSize(100),
                  margin: getMargin(top: 32),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      // User profile image.
                      CustomImageView(
                          imagePath: ImageConstant.robotAvatar,
                          height: getSize(100),
                          width: getSize(100),
                          radius: BorderRadius.circular(getHorizontalSize(50)),
                          alignment: Alignment.center),
                      // Edit icon.
                      CustomImageView(
                          svgPath: ImageConstant.imgEdit,
                          height: getSize(25),
                          width: getSize(25),
                          alignment: Alignment.bottomRight)
                    ],
                  ),
                ),
              ),
              // Full Name text field.
              CustomInputFieldFull(
                inputController: fullNameController,
                headerText: "Full Name",
                hintText: 'Enter your name',
                iconPath: ImageConstant.profileIcon,
                isObscured: false,
              ),
              // Date picker field.
              Padding(
                padding: getPadding(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: getPadding(left: 0),
                      child: Text(
                        "Birth date",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtOpenSansBold16(context),
                      ),
                    ),
                    Padding(
                      padding: getPadding(top: 14),
                    ),
                    DatePickerField(
                        dateController: dateController,
                        hintText: 'Enter birth date',
                        iconPath: ImageConstant.hideIcon),
                  ],
                ),
              ),
              // Country dropdown field.
              Padding(
                padding: getPadding(top: 20),
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
                    Padding(
                      padding: getPadding(top: 14),
                    ),
                    DropdownField(
                      hintText: 'Select Country',
                      iconPath: ImageConstant.imgArrowdown,
                      dropdownItems: countriesList,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCountry = newValue;
                        });
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: getMargin(
          left: 24,
          right: 24,
          bottom: 56,
        ),
        decoration: AppDecoration.outlineGray100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Continue button that navigates to the next screen.
            CustomButton(
                height: getVerticalSize(58),
                text: "Continue",
                onTap: () {
                  onTapContinue(context);
                })
          ],
        ),
      ),
    );
  }

  // Method for handling the onTap event of the back button, which navigates back to the previous screen.
  onTapImgArrowleft(BuildContext context) {
    Navigator.pop(context);
  }

  // Method for handling the onTap event of the Continue button, which navigates to the next screen.

  onTapContinue(BuildContext context) {
    if (fullNameController.text.isEmpty ||
        dateController.text.isEmpty ||
        (selectedCountry == null || selectedCountry!.isEmpty)) {
      const snackBar = SnackBar(
        backgroundColor: Colors.red,
        content: Text('Please fill out all fields.'),
      );

      // Find the Scaffold in the widget tree and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                SignUpBloc(authRepository: context.read<AuthRepository>()),
            child: SignUpStepTwoScreen(
              fullName: fullNameController.text,
              birthDate: dateController.text,
              country: selectedCountry!,
              // and so on for the rest of your data
            ),
          ),
        ),
      );
    }
  }

//   onTapContinue(BuildContext context) {
//     print(dateController.text);
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => BlocProvider(
//           create: (context) =>
//               SignUpBloc(authRepository: context.read<AuthRepository>()),
//           child: SignUpStepTwoScreen(
//             fullName: fullNameController.text,
//             birthDate: dateController.text,
//             country: selectedCountry!,
//             // and so on for the rest of your data
//           ),
//         ),
//       ),
//     );
//   }
// }
}
