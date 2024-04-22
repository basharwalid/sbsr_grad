import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sbsr_grad/Core/Base/BaseViewModel.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
import 'package:sbsr_grad/Domain/Exceptions/FirebaseAuthException.dart';
import 'package:sbsr_grad/Domain/Exceptions/TimeOutOperationsException.dart';
import 'package:sbsr_grad/Domain/Exceptions/UnknownException.dart';
import 'package:sbsr_grad/Domain/Models/MyUser.dart';
import 'package:sbsr_grad/Domain/UseCase/GetUserDataUseCase.dart';
import 'package:sbsr_grad/Domain/UseCase/UpdateUserDataUseCase.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/ProfileTab/EditProfile/EditProfileNavigator.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class EditProfileViewModel extends BaseViewModel<EditProfileNavigator> {
  UpdateUserDataUseCase useCase;
  MyUser? user;
  GetUserDataUseCase userDataUseCase;

  EditProfileViewModel({required this.useCase, required this.userDataUseCase});

  String? errorMessage;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

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
    if (phoneNumber.isEmpty) {
      return "Please Enter Phone Number";
    } else {
      return null;
    }
  }

  updateUserData() async {
    navigator!.showLoadingMessage(message: "Loading");
    try {
      user!.name = nameController.text;
      user!.email = emailController.text;
      user!.phoneNumber = phoneController.text;
      var response = await useCase.invoke(
          user: user!, uid: provider!.getUser()!.uid, file: image);
      provider!.updateUser(user: response);
      notifyListeners();
      navigator!.goBack();
      navigator!.showSuccessMessage(
          message: "Account updated successfully",
          backgroundColor: MyTheme.lightPurple,
          posActionTitle: "ok");
    } catch (e) {
      if (e is TimeOutOperationsException) {
        navigator!.showFailMessage(
            message: e.errorMessage, backgroundColor: MyTheme.red);
        notifyListeners();
      } else if (e is FirebaseUserAuthException) {
        navigator!.showFailMessage(
            message: e.errorMessage, backgroundColor: MyTheme.red);
        notifyListeners();
      } else if (e is UnknownException) {
        navigator!.showFailMessage(
            message: e.errorMessage, backgroundColor: MyTheme.red);
        notifyListeners();
      }
    }
  }

  void loadData() async {
    errorMessage = null;
    user = null;
    notifyListeners();
    try {
      await userDataUseCase.invoke(uid: provider!.getUser()!.uid);
      user ??= MyUser(
          email: provider!.getUser()!.email!,
          name: provider!.getUser()!.displayName!,
          password: "Private",
          phoneNumber: provider!.getUser()!.phoneNumber!,
          imageURL: provider!.getUser()!.photoURL ?? "");
      nameController.text = user!.name;
      emailController.text = user!.email;
      phoneController.text = user!.phoneNumber;
      notifyListeners();
    } catch (e) {
      if (e is TimeOutOperationsException) {
        navigator!.showFailMessage(
            message: e.errorMessage, backgroundColor: MyTheme.red);
        notifyListeners();
      }else if (e is UnknownException) {
        navigator!.showFailMessage(
            message: e.errorMessage, backgroundColor: MyTheme.red);
        notifyListeners();
      }
    }
  }
}
