import 'package:sbsr_grad/Core/Base/BaseViewModel.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
import 'package:sbsr_grad/Domain/Models/MyUser.dart';
import 'package:sbsr_grad/Domain/UseCase/userSignOutUseCase.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/ProfileTab/ProfileNavigator.dart';

class ProfileViewModel extends BaseViewModel<ProfileNavigator> {
  UserSignOutUseCase userSignOutUseCase;

  ProfileViewModel({required this.userSignOutUseCase});

  goToLoginScreen() {
    navigator!.goToLoginScreen();
  }
  onSignOutPress(){
      navigator!.showQuestionMessage(message: "Are you sure you want to sign out?",
        negativeActionTitle: "cancel",
        posActionTitle: "Yes",
        posAction: userSignOut,
      );
  }
  void userSignOut() async {
    navigator!.showLoadingMessage(message: "Logging Out");
    try {
      await userSignOutUseCase.invoke();
      navigator!.goBack();
      navigator!.goToLoginScreen();
    } catch (e) {
      navigator!.goBack();
      navigator!
          .showFailMessage(message: e.toString(), backgroundColor: MyTheme.red);
    }
  }
}
