import 'package:flutter/cupertino.dart';
import 'package:sbsr_grad/Core/Base/BaseViewModel.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
import 'package:sbsr_grad/Domain/Models/MyUser.dart';
import 'package:sbsr_grad/Domain/UseCase/CreateAccountUseCase.dart';
import 'package:sbsr_grad/Presentation/Ui/SignUpScreen/SignUpNavigator.dart';

class SignUpViewModel extends BaseViewModel<SignUpNavigator> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  CreateAccountUseCase useCase;

  SignUpViewModel({required this.useCase});

  final formKey = GlobalKey<FormState>();

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

  String? nameValidation(String name) {
    if (name.isEmpty) {
      return "Name Can't be empty";
    } else {
      return null;
    }
  }

  String? phoneValidation(String phoneNumber) {
    if (phoneNumber.trim().isEmpty) {
      return "Please Enter Phone Number";
    } else {
      return null;
    }
  }

  void goToLoginScreen() {
    navigator!.goToLoginScreen();
  }

  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      if (passwordController.text == passwordConfirmationController.text) {
        try {
          navigator!.showLoadingMessage(message: "signing you up");
          var response = await useCase.invoke(
              file: image,
              user: MyUser(
                  email: emailController.text,
                  name: nameController.text,
                  password: passwordController.text,
                  phoneNumber: phoneController.text,
                  imageURL: ""));
          provider!.updateUser(user: response);
          navigator!.goBack();
          navigator!.showSuccessMessage(
              message: "signed up successfully",
              backgroundColor: MyTheme.lightPurple,
              posActionTitle: "ok",
              posAction: goToLoginScreen);
        } catch (e) {
          navigator!.goBack();
          navigator!.showFailMessage(
              message: e.toString(),
              backgroundColor: MyTheme.red,
              negAction: goToLoginScreen,
              negActionTitle: "Cancel");
        }
      }
    }
  }
}
