import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sbsr_grad/Core/Providers/ThemeProvider.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
import 'package:sbsr_grad/Presentation/Ui/GetStarted/IntroView.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeView.dart';
import 'package:sbsr_grad/Presentation/Ui/LoginScreen/LoginView.dart';



class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash screen';
  bool firstTime;
  bool isLoggedIn;
  User? user;

  SplashScreen(
      {super.key,
      required this.firstTime,
      required this.isLoggedIn,
      this.user});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return AnimatedSplashScreen(
      splash: Center(
        child: SizedBox(
          height: 150,
          child: themeProvider.isPurple()
              ? Image.asset(
            "assets/images/logo.png",
            fit: BoxFit.cover,
          )
              : Image.asset(
            "assets/images/logo.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
      nextScreen: firstTime
          ? const IntroView()
          : isLoggedIn || user != null
          ? const HomeView()
          : const LoginScreenView(),
      duration: 2000,
      backgroundColor:
      themeProvider.isPurple() ? MyTheme.darkPurple : MyTheme.offWhite,
      splashIconSize: 300,
      splashTransition: SplashTransition.scaleTransition,
    );
  }
}
