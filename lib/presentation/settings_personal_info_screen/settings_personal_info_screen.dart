import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/color_constant.dart';
import '../../../core/utils/countries_list.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_style.dart';
import '../../bloc/personal_settings/personal_settings_bloc.dart';
import '../../bloc/personal_settings/personal_settings_event.dart';
import '../../bloc/personal_settings/personal_settings_state.dart';
import '../login_and_registration_screens/signup_one_screen/widgets/date_picker_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_drop_down.dart';
import '../widgets/custom_image_view.dart';
import '../widgets/custom_input_field_full.dart';

class SettingsPersonalInfoScreen extends StatefulWidget {
  const SettingsPersonalInfoScreen({Key? key}) : super(key: key);

  @override
  State<SettingsPersonalInfoScreen> createState() =>
      _SettingsPersonalInfoScreenState();
}

class _SettingsPersonalInfoScreenState
    extends State<SettingsPersonalInfoScreen> {
  // Declaring text editing controllers to control the full name and date input fields.
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  String? selectedCountry;
  // final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  void dispose() {
    // Disposing of the fullNameController when the widget is disposed of.
    fullNameController.dispose();
    dateController.dispose();
    // emailController.dispose();
    usernameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Creating the UI of the SignUpStepOneScreen inside the SafeArea to ensure no overlap with system UI.
    return BlocListener<PersonalSettingsBloc, PersonalSettingsState>(
      listener: (context, state) {
        if (state is PersonalSettingsUpdated) {
          _showSuccessDialog();
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                  padding: getPadding(
                    top: 26,
                  ),
                  child: Row(
                    children: [
                      // Back button with custom image.
                      CustomImageView(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? ColorConstant.white
                              : ColorConstant.black,
                          svgPath: ImageConstant.imgArrowleft,
                          height: getSize(36),
                          width: getSize(36),
                          onTap: () {
                            onTapImgArrowleft(context);
                          }),
                      // Title text.
                      Container(
                        margin: getMargin(right: 30, left: 26),
                        child: Text(
                          "Personal Info 📋",
                          maxLines: null,
                          textAlign: TextAlign.center,
                          style: AppStyle.txtOpenSansBold32(context),
                        ),
                      ),
                    ],
                  ),
                ),

                // User profile image with an edit icon on the bottom right corner.
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: getSize(120),
                    width: getSize(120),
                    margin: getMargin(top: 32),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        // User profile image.
                        CustomImageView(
                            imagePath: ImageConstant.robotAvatar,
                            height: getSize(140),
                            width: getSize(140),
                            radius:
                                BorderRadius.circular(getHorizontalSize(50)),
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
                // Custom Input field for Username
                CustomInputFieldFull(
                  inputController: usernameController,
                  headerText: "Username",
                  hintText: "Select username",
                  iconPath: ImageConstant.profileIcon,
                  isObscured: false,
                ),
                // // Custom Input field for Email
                // CustomInputFieldFull(
                //   inputController: emailController,
                //   headerText: "Email",
                //   hintText: "Enter email",
                //   iconPath: ImageConstant.emailIcon,
                //   isObscured: false,
                // ),
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
                          style: AppStyle.txtOpenSansBold18(context),
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
                ),
                Container(
                  margin: getMargin(
                    top: 38,
                    left: 24,
                    right: 24,
                    bottom: 56,
                  ),
                  child:
                      BlocBuilder<PersonalSettingsBloc, PersonalSettingsState>(
                    builder: (context, state) {
                      if (state is PersonalSettingsLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return CustomButton(
                          height: getVerticalSize(58),
                          text: "Save Changes",
                          onTap: () {
                            onTapContinue(context);
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
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
        usernameController.text.isEmpty ||
        // emailController.text.isEmpty ||
        (selectedCountry == null || selectedCountry!.isEmpty)) {
      const snackBar = SnackBar(
        backgroundColor: Colors.red,
        content: Text('Please fill out all fields.'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      context.read<PersonalSettingsBloc>().add(
            UpdatePersonalSettings(
              fullName: fullNameController.text,
              birthDate: dateController.text,
              username: usernameController.text,
              // email: emailController.text,
              country: selectedCountry!,
            ),
          );
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Success"),
          content: const Text("Personal information successfully updated"),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
