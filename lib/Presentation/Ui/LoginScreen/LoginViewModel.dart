import 'package:flutter/cupertino.dart';
import 'package:sbsr_grad/Core/Base/BaseViewModel.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
import 'package:sbsr_grad/Domain/Exceptions/FirebaseUserDatabaseException.dart';
import 'package:sbsr_grad/Domain/UseCase/SigninWithEmailandPassswordUseCase.dart';
import 'package:sbsr_grad/Domain/UseCase/checkUserExistUseCase.dart';
import 'package:sbsr_grad/Presentation/Ui/LoginScreen/LoginNavigator.dart';

class LoginViewModel extends BaseViewModel<LoginNavigator> {
  SignInWithEmailAndPasswordUseCase signInWithEmailAndPasswordUseCase;
  CheckIfUserExistUseCase checkIfUserExistUseCase;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  LoginViewModel(
      {required this.signInWithEmailAndPasswordUseCase,
      required this.checkIfUserExistUseCase});

  String? emailValidation(String email) {
    if (email.isEmpty) {
      return "Email field can't be empty";
    } else if (!RegExp(r"^[a-zA-Z0-9.!#$%&'+/=?^_`{|}~-]+"
            r"@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
            r"{0,253}[a-zA-Z0-9])?(?:.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
            r"{0,253}[a-zA-Z0-9])?)$")
        .hasMatch(email)) {
      return "Please enter a valid email";
    } else {
      return null;
    }
  }

  String? passwordValidation(String password) {
    if (password.isEmpty) {
      return "Password must not be empty";
    }
    return null;
  }

  void goToSignUp() {
    navigator!.goToSignUp();
  }

  void goToForgetPasswordScreen() {
    navigator!.goToForgetPasswordScreen();
  }

  void goToHomeScreen(){
    navigator!.goToHomeScreen();
  }

  Future<void> signInWithEmailAndPassword() async {
    if (formKey.currentState!.validate()) {
      try {
        navigator!.showLoadingMessage(message: "Logging in");
        var response = await signInWithEmailAndPasswordUseCase.invoke(
            email: emailController.text, password: passwordController.text);
        var exist = await checkIfUserExistUseCase.invoke(uid: response.uid);
        provider!.updateUser(user: response);
        if(exist){
          navigator!.goBack();
            navigator!.showSuccessMessage(message: "Welcome",
                backgroundColor: MyTheme.lightPurple,
                posActionTitle: "Ok",
                posAction: goToHomeScreen,
            );
        }else{
          navigator!.showFailMessage(message: "Try again",
              backgroundColor: MyTheme.red,
              posActionTitle: "cancel",
              posAction: goToForgetPasswordScreen
          );
        }
        } catch (e) {
        print(e);
      }
    }
  }
}
