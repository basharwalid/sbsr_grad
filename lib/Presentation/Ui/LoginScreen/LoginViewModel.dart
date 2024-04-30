import 'package:flutter/cupertino.dart';
import 'package:sbsr_grad/Core/Base/BaseViewModel.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
import 'package:sbsr_grad/Domain/Models/MyUser.dart';
import 'package:sbsr_grad/Domain/UseCase/CreateAccountUseCase.dart';
import 'package:sbsr_grad/Domain/UseCase/SignInWithGoogleUseCase.dart';
import 'package:sbsr_grad/Domain/UseCase/SigninWithEmailandPassswordUseCase.dart';
import 'package:sbsr_grad/Domain/UseCase/checkUserExistUseCase.dart';
import 'package:sbsr_grad/Presentation/Ui/LoginScreen/LoginNavigator.dart';

class LoginViewModel extends BaseViewModel<LoginNavigator> {
  CreateAccountUseCase createAccountUseCase;
  SignInWithEmailAndPasswordUseCase signInWithEmailAndPasswordUseCase;
  CheckIfUserExistUseCase checkIfUserExistUseCase;
  SignInWithGoogleUseCase signInWithGoogleUseCase;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  LoginViewModel({
    required this.signInWithEmailAndPasswordUseCase,
    required this.checkIfUserExistUseCase,
    required this.createAccountUseCase,
    required this.signInWithGoogleUseCase
  });

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

  String? passwordValidation(String input) {
    if (input.isEmpty) {
      return "password Can't Be Empty";
    }else if(input.length < 8){
      return "password is too short";
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
        var userExist = await checkIfUserExistUseCase.invoke(uid: response.uid);
        provider!.updateUser(user: response);
        navigator!.goBack();
        if (userExist) {
          navigator!.showSuccessMessage(
              message: "Welcome Back ${response.displayName}",
              backgroundColor: MyTheme.lightPurple,
              posActionTitle: "Ok",
              posAction: goToHomeScreen);
        } else {
          await createAccountUseCase.invoke(
              user: MyUser(
                  email: response.email ?? "no email",
                  name: response.displayName ?? "no name",
                  password: "private",
                  phoneNumber: "01000000000"));
        }
      } catch (e) {
        navigator!.goBack();
        navigator!.showFailMessage(
            message: "user doesn't exist",
            backgroundColor: MyTheme.red,
            posActionTitle: "cancel",
            );
      }
    }
  }

  void signInWithGoogle()async{
      try{
        var response = await signInWithGoogleUseCase.invoke();
        provider!.updateUser(user: response);
        try{
            var userExist = await checkIfUserExistUseCase.invoke(uid: response.uid);
            if(userExist){
                navigator!.showSuccessMessage(message: "Welcome",
                    backgroundColor: MyTheme.lightPurple,
                  posActionTitle: "Ok",
                  posAction: goToHomeScreen,
                );
            }else{
              await createAccountUseCase.invoke(
                  user: MyUser(
                      email: response.email ?? "no email",
                      name: response.displayName ?? "no name",
                      password: "private",
                      phoneNumber: "01000000000"));
            }
        }catch(e){
            navigator!.showFailMessage(message: "Email already in use",
                backgroundColor: MyTheme.red,
                posActionTitle: "cancel",
            );
        }
      }catch (e){
        navigator!.showFailMessage(message: "Error",
            backgroundColor: MyTheme.red,
            posActionTitle: "cancel"
        );
      }
  }
}
