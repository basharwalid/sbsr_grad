import 'package:flutter/cupertino.dart';
import 'package:sbsr_grad/Core/Base/BaseViewModel.dart';
import 'package:sbsr_grad/Presentation/Ui/LoginScreen/LoginNavigator.dart';

class LoginViewModel extends BaseViewModel<LoginNavigator>{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? emailValidation(String email){
    if(email.isEmpty)
    {
      return "Email field can't be empty";
    }
    else if(!RegExp(r"^[a-zA-Z0-9.!#$%&'+/=?^_`{|}~-]+"
    r"@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?(?:.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?)$")
        .hasMatch(email)){
      return "Please enter a valid email";
    }
    else {
      return null;
    }
  }

  String? passwordValidation(String password){
    if(password.trim().isEmpty){
      return "Password must not be empty";
    }
    return null;
  }
}