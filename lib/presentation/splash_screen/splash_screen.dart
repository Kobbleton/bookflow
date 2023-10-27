import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../bloc/reg_auth_blocs/authentification/authentication_bloc.dart';
import '../../bloc/reg_auth_blocs/authentification/authentication_event.dart';
import '../../bloc/reg_auth_blocs/authentification/authentication_state.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          BlocProvider.of<AuthenticationBloc>(context).add(AppStarted());
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    bool hasNavigated = false;

    return BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) async {
          var navigator =
              Navigator.of(context); // Get NavigatorState before async gap.

          if (!hasNavigated) {
            if (state is AuthenticationAuthenticated) {
              await Future.delayed(const Duration(seconds: 2));
              try {
                navigator.pushReplacementNamed(AppRoutes.homeScreen);
                hasNavigated = true;
              } catch (e) {
                // Navigator was disposed, handle the error appropriately.
              }
            } else if (state is AuthenticationUnauthenticated) {
              await Future.delayed(const Duration(seconds: 2));
              try {
                navigator.pushReplacementNamed(AppRoutes.welcomeScreen);
                hasNavigated = true;
              } catch (e) {
                // Navigator was disposed, handle the error appropriately.
              }
            }
          }
        },
        child: Builder(
          builder: (innerContext) => SafeArea(
            top: false,
            bottom: false,
            child: Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              body: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // CustomImageView(
                    //   svgPath: ImageConstant.logoBig,
                    //   height: MediaQuery.of(context).size.height *
                    //       0.13, // 13% of screen height
                    //   width: MediaQuery.of(context).size.width *
                    //       0.6, // 60% of screen width
                    //   margin: EdgeInsets.only(
                    //     top: MediaQuery.of(context).size.height *
                    //         0.01, // 1% of screen height
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height *
                            0.00, // 4% of screen height
                        bottom: MediaQuery.of(context).size.height *
                            0.05, // 10% of screen height
                      ),
                      child: Text(
                        "BookFlow",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtOpenSansBold48(context),
                      )
                          .animate()
                          .move(
                              begin: const Offset(0, -16),
                              curve: Curves.easeOutQuad)
                          .fadeIn(duration: 2200.ms, curve: Curves.easeOutQuad),
                    ),
                    Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.height * 0.16,
                            height: MediaQuery.of(context).size.height * 0.16,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Padding(
                            padding: getPadding(top: 2, right: 2),
                            child: Lottie.asset(
                              'assets/animations/B.json',
                              width: MediaQuery.of(context).size.height * 0.16,
                              height: MediaQuery.of(context).size.height * 0.2,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      )
                          .animate()
                          .move(
                              begin: const Offset(0, 16),
                              curve: Curves.easeOutQuad)
                          .fadeIn(duration: 2200.ms, curve: Curves.easeOutQuad),
                    ),
                    // SpinKitSpinningLines(
                    //   color: ColorConstant.cyan500,
                    //   size: MediaQuery.of(context).size.width *
                    //       0.25, // 30% of screen width
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
