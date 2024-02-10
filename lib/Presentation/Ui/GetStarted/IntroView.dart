import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:sbsr_grad/Core/Base/BaseState.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
import 'package:sbsr_grad/Presentation/Ui/GetStarted/IntroNavigator.dart';
import 'package:sbsr_grad/Presentation/Ui/GetStarted/IntroViewModel.dart';
import 'package:sbsr_grad/Presentation/Ui/LoginScreen/LoginView.dart';

class IntroView extends StatefulWidget {
  static const String routeName = 'intro';

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends BaseState<IntroView, IntroViewModel>
    implements IntroNavigator {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    super.build(context);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Welcome Abroad",
            body: "we are here to connect you to Any Bus ",
            decoration: PageDecoration(
              titleTextStyle: theme.textTheme.displayLarge!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 24),
              bodyTextStyle: theme.textTheme.displayLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            image: Lottie.asset('assets/json/bus1.json'),
          ),
          PageViewModel(
            title: "Live notifications!",
            body:
                "Never miss your bus again! Receive instant alerts when your bus is approaching, so you can say goodbye to frantic dashes and hello to relaxed waiting",
            decoration: PageDecoration(
              titleTextStyle: theme.textTheme.displayLarge!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 24),
              bodyTextStyle: theme.textTheme.displayLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            image: Lottie.asset('assets/json/bell.json'),
          ),
          PageViewModel(
            title: "Got A favourite bus Ride?",
            body: "save your steps! Bookmark your go-to bus routes and stops for instant access With a simple tap, get updates and directions straight to your favorite destinations",
            decoration: PageDecoration(
              titleTextStyle: theme.textTheme.displayLarge!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 24),
              bodyTextStyle: theme.textTheme.displayLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            image: Center(
              child: Lottie.asset('assets/json/Favortie.json'),
            ),
          ),
        ],
        done: const Text("Done"),
        onDone: goToLoginScreen,
        next: const Text("Next"),
        onSkip: goToLoginScreen,
        back: const Text("Back"),
        nextStyle: ButtonStyle(
            textStyle: MaterialStateProperty.all(
                const TextStyle(color: MyTheme.offWhite, fontSize: 18)),
            foregroundColor: MaterialStateProperty.all(MyTheme.offWhite)),
        doneStyle: ButtonStyle(
            textStyle: MaterialStateProperty.all(
                const TextStyle(color: MyTheme.offWhite, fontSize: 18)),
            foregroundColor: MaterialStateProperty.all(MyTheme.offWhite)),
        backStyle: ButtonStyle(
            textStyle: MaterialStateProperty.all(
                const TextStyle(color: MyTheme.offWhite, fontSize: 18)),
            foregroundColor: MaterialStateProperty.all(MyTheme.offWhite)),
        dotsDecorator: DotsDecorator(
          size: const Size.square(10),
          activeSize: const Size(10, 10),
          activeShape:
              BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: MyTheme.offWhite,
          spacing: const EdgeInsets.symmetric(horizontal: 5),
        ),
        showBackButton: true,
      ),
    ));
  }

  @override
  IntroViewModel initViewModel() {
    return IntroViewModel();
  }

  @override
  goToLoginScreen() {
    Navigator.pushReplacementNamed(context, LoginScreenView.routeName);
  }
}
