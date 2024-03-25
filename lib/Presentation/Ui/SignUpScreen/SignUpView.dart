import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sbsr_grad/Core/Base/BaseState.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
import 'package:sbsr_grad/Domain/UseCase/CreateAccountUseCase.dart';
import 'package:sbsr_grad/Presentation/Ui/LoginScreen/LoginView.dart';
import 'package:sbsr_grad/Presentation/Ui/SignUpScreen/SignUpNavigator.dart';
import 'package:sbsr_grad/Presentation/Ui/SignUpScreen/SignUpViewModel.dart';
import 'package:sbsr_grad/Presentation/Ui/Widget/CustomPasswordTextFormField.dart';
import 'package:sbsr_grad/Presentation/Ui/Widget/CustomTextFormField.dart';

class SignUpView extends StatefulWidget {
  static const String routeName = 'Signup';

  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends BaseState<SignUpView, SignUpViewModel>
    implements SignUpNavigator {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<SignUpViewModel>(
      create: (context) => viewModel,
      child: Consumer<SignUpViewModel>(
        builder: (context, value, child) => SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Form(
                  key: viewModel.formKey,
                  child: Column(
                    children: [
                      AppBar(
                        title: const Text("Sign Up"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Stack(
                        children: [
                          Container(
                            clipBehavior: Clip.antiAlias,
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            height: MediaQuery.sizeOf(context).width * 0.4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                color: MyTheme.offWhite),
                            child:  viewModel.image == null
                                ? Lottie.asset(
                                "assets/json/UserNotFound.json")
                                :Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: FileImage(File(viewModel.image!.path)),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 120,
                            child: InkWell(
                              onTap: viewModel.pickImageFromGallery,
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: MyTheme.lightPurple,
                                    borderRadius: BorderRadius.circular(25)),
                                child: const Icon(Icons.linked_camera_sharp),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextFormField(
                          controller: viewModel.emailController,
                          hintText: "Email address",
                          prefixIcon: const Icon(Icons.email_outlined),
                          validator: viewModel.emailValidation,
                          inputType: TextInputType.emailAddress),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                          controller: viewModel.nameController,
                          hintText: "Name",
                          prefixIcon: const Icon(EvaIcons.file_text_outline),
                          validator: viewModel.nameValidation,
                          inputType: TextInputType.name),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                          controller: viewModel.phoneController,
                          hintText: "Phone number",
                          prefixIcon: const Icon(Icons.call_rounded),
                          validator: viewModel.phoneValidation,
                          inputType: TextInputType.phone),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomPasswordTextFormField(
                          controller: viewModel.passwordController,
                          hintText: "Enter Your password",
                          prefixIcon: const Icon(Icons.lock_outline),
                          validator: viewModel.passwordValidation,
                          inputType: TextInputType.visiblePassword),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomPasswordTextFormField(
                          controller: viewModel.passwordConfirmationController,
                          hintText: "Confirm Password",
                          prefixIcon: const Icon(Icons.lock_outline),
                          validator: viewModel.passwordValidation,
                          inputType: TextInputType.visiblePassword),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          onPressed: value.register,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "Sign up",
                                  style:
                                      Theme.of(context).textTheme.displayLarge,
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
        ),
      ),
    );
  }

  @override
  SignUpViewModel initViewModel() {
    return SignUpViewModel(useCase: injectCreateAccountUseCase());
  }

  @override
  goToLoginScreen() {
    Navigator.pushReplacementNamed(context, LoginScreenView.routeName);
  }
}
