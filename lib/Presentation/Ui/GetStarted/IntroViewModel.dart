import 'package:sbsr_grad/Core/Base/BaseViewModel.dart';
import 'package:sbsr_grad/Presentation/Ui/GetStarted/IntroNavigator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroViewModel extends BaseViewModel<IntroNavigator> {
  Future<void> onDoneClick() async {
    navigator!.goToLoginScreen();
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("firstTime", false);
  }
}
