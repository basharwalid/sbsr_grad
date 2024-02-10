import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sbsr_grad/Core/Base/BaseState.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
import 'package:sbsr_grad/Presentation/Ui/LoginScreen/LoginView.dart';
import 'package:sbsr_grad/Presentation/Ui/SignUpScreen/SignUpNavigator.dart';
import 'package:sbsr_grad/Presentation/Ui/SignUpScreen/SignUpViewModel.dart';
import 'package:sbsr_grad/Presentation/Ui/Widget/CustomTextFormField.dart';

class SignUpView extends StatefulWidget {
  static const String routeName = 'Signup';
  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends BaseState<SignUpView , SignUpViewModel> implements SignUpNavigator {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: viewModel!.formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    "assets/images/logo.png",
                    width: double.infinity,
                    height: 120,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Sign Up",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                      controller: viewModel!.emailController,
                      hintText: "Email address",
                      prefixIcon: const Icon(Icons.email_outlined),
                      validator: viewModel!.emailValidation,
                      inputType: TextInputType.emailAddress),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                      controller: viewModel!.nameController,
                      hintText: "Name",
                      prefixIcon: const Icon(EvaIcons.file_text_outline),
                      validator: viewModel!.nameValidation,
                      inputType: TextInputType.name),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                      controller: viewModel!.phoneController,
                      hintText: "Phone number",
                      prefixIcon: const Icon(Icons.call_rounded),
                      validator: viewModel!.phoneValidation,
                      inputType: TextInputType.phone),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                      controller: viewModel!.passwordController,
                      hintText: "Password",
                      prefixIcon: const Icon(Icons.lock_outline),
                      validator: viewModel!.passwordValidation,
                      inputType: TextInputType.visiblePassword),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                      controller: viewModel!.passwordConfirmationController,
                      hintText: "Confirm Password",
                      prefixIcon: const Icon(Icons.lock_outline),
                      validator: viewModel!.passwordValidation,
                      inputType: TextInputType.visiblePassword),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "Sign up",
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have account?",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      TextButton(
                          onPressed: goToLoginScreen,
                          child: Text(
                            "Login",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(color: MyTheme.lightPurple),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  SignUpViewModel initViewModel() {
    return SignUpViewModel();
  }

  @override
  goToLoginScreen() {
    Navigator.pushReplacementNamed(context, LoginScreenView.routeName);
  }
}
