
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sbsr_grad/Core/Base/BaseViewModel.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/ProfileTab/EditProfile/EditProfileNavigator.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class EditProfileViewModel extends BaseViewModel<EditProfileNavigator>{
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
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

  String? nameValidation(String name){
    if(name.isEmpty){
      return "Name Can't be empty";
    }
    else{
      return null;
    }
  }

  String? phoneValidation(String phoneNumber){
    if(phoneNumber.trim().isEmpty){
      return "Please Enter Phone Number";
    }else{
      return null;
    }
  }

  Future<void> updateUserProfile(User user) async {
    await _firestore.collection('Users').doc(user.uid).update({
      'name': nameController.text,
      'email': emailController.text,
      'phoneNumber': phoneController.text,
    });
  }

}