import 'package:flutter/material.dart';
import 'package:sbsr_grad/Core/Base/BaseViewModel.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
import 'package:sbsr_grad/Domain/UseCase/UpdateUserPasswordUseCase.dart';
import 'package:sbsr_grad/Presentation/Ui/ChangePassword/ChangePasswordNavigator.dart';

class ChangePasswordViewModel extends BaseViewModel<ChangePasswordNavigator> {
  UpdateUserPasswordUseCase useCase;
  final formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newPasswordConfirmationController =
      TextEditingController();

  ChangePasswordViewModel({required this.useCase});

  String? passwordValidation(String input) {
    if (input.isEmpty) {
      return "password Can't Be Empty";
    }else if(input.length < 8){
      return "password is too short";
    }
    return null;
  }

  // validate the password confirmation is not empty and the same as the password
  String? passwordConfirmationValidation(String input) {
    if (input.isEmpty) {
      return "password Can't Be Empty";
    } else if (input != newPasswordController.text) {
      return "password Dose Not Match";
    }
    return null;
  }

  Future<void> updatePassword() async {
    if (formKey.currentState!.validate()) {
      try {
        navigator!.showLoadingMessage(message: "Updating Your Password");
        useCase.invoke(
            newPassword: newPasswordController.text,
            password: passwordController.text,
            email: provider!.user!.email!);
        passwordController.text = "";
        newPasswordController.text = "";
        newPasswordConfirmationController.text = "";
        navigator!.goBack();
        navigator!.showSuccessMessage(
            message: "Password Updated Successfully",
            backgroundColor: MyTheme.lightGreen,
            posActionTitle: "Ok",
            posAction: goToProfileScreen);
      } catch (e) {
        navigator!.goBack();
        navigator!.showFailMessage(
            backgroundColor: MyTheme.red,
          message: "Try again"
        );
      }
    }
  }

  void goToProfileScreen() {
    navigator!.goToProfileScreen();
  }
}
