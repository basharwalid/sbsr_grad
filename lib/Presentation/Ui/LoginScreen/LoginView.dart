import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sbsr_grad/Core/Base/BaseNavigator.dart';
import 'package:sbsr_grad/Core/Base/BaseState.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
import 'package:sbsr_grad/Presentation/Ui/LoginScreen/LoginViewModel.dart';
import 'package:sbsr_grad/Presentation/Ui/Widget/CustomTextFormField.dart';

class LoginScreenView extends StatefulWidget {
  static const String routeName = 'Login';

  @override
  State<LoginScreenView> createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends BaseState<LoginScreenView, LoginViewModel>
    implements BaseNavigator {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: viewModel!.formKey,
            child: Column(
              children: [
                const SizedBox(height: 20,),
                Image.asset(
                  "assets/images/logo.png",
                  width: double.infinity,
                  height: 150,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Sign In",
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 24),
                ),
               const SizedBox(height: 30,),
                CustomTextFormField(
                    controller: viewModel!.emailController,
                    hintText: "Enter your Email",
                    prefixIcon: const Icon(Icons.email_outlined),
                    validator: viewModel!.emailValidation,
                    inputType: TextInputType.emailAddress),
                const SizedBox(height: 15,),
                CustomTextFormField(
                    controller: viewModel!.passwordController,
                    hintText: "Enter your Password",
                    prefixIcon: const Icon(EvaIcons.lock_outline),
                    validator: viewModel!.passwordValidation,
                    inputType: TextInputType.visiblePassword),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: (){},
                        child: const Text("Forget Password?")
                    ),
                  ],
                ),
                const SizedBox(height: 30,),
                ElevatedButton(onPressed: (){},
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text("Login",
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ),
                      ],
                    )),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have account?",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    TextButton(onPressed: (){},
                        child: Text("Sign up",
                          style: Theme.of(context).textTheme.displayMedium!.copyWith(color: MyTheme.lightPurple),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  LoginViewModel initViewModel() {
    return LoginViewModel();
  }
}
