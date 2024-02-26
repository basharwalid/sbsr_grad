import 'package:sbsr_grad/Core/Base/BaseViewModel.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
import 'package:sbsr_grad/Domain/Models/MyUser.dart';
import 'package:sbsr_grad/Domain/UseCase/GetUserDataUseCase.dart';
import 'package:sbsr_grad/Domain/UseCase/userSignOutUseCase.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/ProfileTab/ProfileNavigator.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/ProfileTab/ProfileView.dart';

class ProfileViewModel extends BaseViewModel<ProfileNavigator> {
  UserSignOutUseCase userSignOutUseCase;
  GetUserDataUseCase getUserDataUseCase;
  MyUser? user;
  String? errorMessage;

  ProfileViewModel({required this.userSignOutUseCase, required this.getUserDataUseCase});

  goToLoginScreen() {
    navigator!.goToLoginScreen();
  }

  goToEditScreen() {
    navigator!.goToEditScreen();
  }

  onSignOutPress() {
    navigator!.showQuestionMessage(
      message: "Are you sure you want to sign out?",
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

  void loadData() async {
    errorMessage = null;
    user = null;
    notifyListeners();
    try {
      user = await getUserDataUseCase.invoke(uid: provider!.getUser()!.uid);
      user ??= MyUser(
          email: provider!.getUser()!.email??"No Email",
          name: provider!.getUser()!.displayName??"No Name",
          password: "Private",
          phoneNumber: provider!.getUser()!.phoneNumber??"No phone number",
          imageURL: provider!.getUser()!.photoURL??"No photo"
      );
    }catch(e){
      errorMessage = e.toString();
    }
  }
}
