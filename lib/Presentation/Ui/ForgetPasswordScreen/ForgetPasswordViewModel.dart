import 'package:flutter/material.dart';
import 'package:sbsr_grad/Core/Base/BaseViewModel.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
import 'package:sbsr_grad/Domain/UseCase/ResetPasswordUseCase.dart';
import 'package:sbsr_grad/Presentation/Ui/ForgetPasswordScreen/ForgetPasswordNavigator.dart';

class ForgetPasswordViewModel extends BaseViewModel<ForgetPasswordNavigator> {
  TextEditingController emailController = TextEditingController();
  ResetPasswordUsecase resetPasswordUseCase;
  final formKey = GlobalKey<FormState>();

  ForgetPasswordViewModel({required this.resetPasswordUseCase});

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

  goToLoginScreen() {
    navigator!.goToLoginScreen();
  }

  //reset password email send
  Future<void> resetPassword() async {
    if (formKey.currentState!.validate()) {
      navigator!.showLoadingMessage(message: "Sending Email");
      try {
        await resetPasswordUseCase.invoke(email: emailController.text);
        navigator!.goBack();
        navigator!.showSuccessMessage(
            message: "Email sent",
            posActionTitle: "OK",
            posAction: goToLoginScreen,
            backgroundColor: MyTheme.lightPurple);
      } catch (e) {
        navigator!.goBack();
        navigator!.showFailMessage(
            message: e.toString(),
            posActionTitle: "cancel",
            backgroundColor: MyTheme.red);
      }
    }
  }
}
