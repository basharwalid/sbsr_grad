import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sbsr_grad/Core/Base/BaseState.dart';
import 'package:sbsr_grad/Core/Providers/ThemeProvider.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
import 'package:sbsr_grad/Presentation/Ui/GetStarted/IntroNavigator.dart';
import 'package:sbsr_grad/Presentation/Ui/GetStarted/IntroViewModel.dart';
import 'package:sbsr_grad/Presentation/Ui/LoginScreen/LoginView.dart';

class IntroView extends StatefulWidget {
  static const String routeName = 'intro';

  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends BaseState<IntroView, IntroViewModel>
    implements IntroNavigator {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: IntroductionScreen(
      bodyPadding: const EdgeInsets.all(12),
      pages: [
        PageViewModel(
            title: "Welcome Abroad!",
            decoration: PageDecoration(
              bodyAlignment: Alignment.center,
              titleTextStyle: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 24),
            ),
            bodyWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset("assets/json/bus1.json"),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "SBSR is your daily Application to catch your bus and never get late to work again",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 22),
                )
              ],
            )),
        PageViewModel(
            title: "Live notifications!",
            decoration: PageDecoration(
              bodyAlignment: Alignment.center,
              titleTextStyle: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 24),
            ),
            bodyWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset("assets/json/bell.json"),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Never miss your bus again! Receive instant alerts when your bus is approaching, so you can say goodbye to frantic dashes and hello to relaxed waiting",
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 22),
                )
              ],
            )),
        PageViewModel(
            title: "Got A favourite bus Ride?",
            decoration: PageDecoration(
              bodyAlignment: Alignment.center,
              titleTextStyle: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 24),
            ),
            bodyWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset("assets/json/Favortie.json"),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "save your steps! Bookmark your go-to bus routes and stops for instant access With a simple tap, get updates and directions straight to your favorite destinations",
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 22),
                )
              ],
            )),
      ],
      done: const Text("Done"),
      onDone: viewModel.onDoneClick,
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
