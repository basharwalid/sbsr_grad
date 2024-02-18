import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:sbsr_grad/Core/Base/BaseNavigator.dart';
import 'package:sbsr_grad/Core/Base/BaseState.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
import 'package:sbsr_grad/Domain/UseCase/CreateAccountUseCase.dart';
import 'package:sbsr_grad/Domain/UseCase/SignInWithGoogleUseCase.dart';
import 'package:sbsr_grad/Domain/UseCase/SigninWithEmailandPassswordUseCase.dart';
import 'package:sbsr_grad/Domain/UseCase/checkUserExistUseCase.dart';
import 'package:sbsr_grad/Presentation/Ui/ForgetPasswordScreen/ForgetPasswordView.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeView.dart';
import 'package:sbsr_grad/Presentation/Ui/LoginScreen/LoginNavigator.dart';
import 'package:sbsr_grad/Presentation/Ui/LoginScreen/LoginViewModel.dart';
import 'package:sbsr_grad/Presentation/Ui/SignUpScreen/SignUpView.dart';
import 'package:sbsr_grad/Presentation/Ui/Widget/CustomTextFormField.dart';
import 'package:sbsr_grad/Presentation/Ui/Widget/SignInWithContainer.dart';

class LoginScreenView extends StatefulWidget {
  static const String routeName = 'Login';

  @override
  State<LoginScreenView> createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends BaseState<LoginScreenView, LoginViewModel>
    implements LoginNavigator {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<LoginViewModel>(
      create: (context) => viewModel,
      child: Consumer<LoginViewModel>(
        builder: (context, value, child) => SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Form(
                  key: viewModel.formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
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
                        "Sign In",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(
                                fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextFormField(
                          controller: viewModel.emailController,
                          hintText: "Enter your Email",
                          prefixIcon: const Icon(Icons.email_outlined),
                          validator: viewModel.emailValidation,
                          inputType: TextInputType.emailAddress),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                          controller: viewModel.passwordController,
                          hintText: "Enter your Password",
                          prefixIcon: const Icon(Icons.lock_outline),
                          validator: viewModel.passwordValidation,
                          inputType: TextInputType.visiblePassword),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: goToForgetPasswordScreen,
                              child: Text(
                                "Forget Password?",
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                        color: MyTheme.lightPurple,
                                        fontSize: 14),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          onPressed: value.signInWithEmailAndPassword,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "Login",
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
                            "Don't have account?",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          TextButton(
                              onPressed: goToSignUp,
                              child: Text(
                                "Sign up",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 100,
                            child:
                                Divider(thickness: 2, color: MyTheme.offWhite),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text("or",
                              style: Theme.of(context).textTheme.displayMedium),
                          const SizedBox(
                            width: 15,
                          ),
                          const SizedBox(
                            width: 100,
                            child:
                                Divider(thickness: 2, color: MyTheme.offWhite),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {},
                          child: SignInWith(
                              text: "Sign in With Apple",
                              image: "assets/images/AppleLogo.png")),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: value.signInWithGoogle,
                          child: SignInWith(
                            text: "Sign in with Google",
                            image: "assets/images/googleLogo.png",
                          ))
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
  LoginViewModel initViewModel() {
    return LoginViewModel(
        signInWithEmailAndPasswordUseCase:
            injectSignInWithEmailAndPasswordUseCase(),
        checkIfUserExistUseCase: inejctCheckIfUserExistUseCase(),
        createAccountUseCase: injectCreateAccountUseCase() , signInWithGoogleUseCase: injectSignInWithGoogleUseCase());
  }

  @override
  goToSignUp() {
    Navigator.pushReplacementNamed(context, SignUpView.routeName);
  }

  @override
  goToForgetPasswordScreen() {
    Navigator.pushNamed(context, ForgetPasswordView.routeName);
  }

  @override
  goToHomeScreen() {
    Navigator.pushReplacementNamed(context, HomeView.routeName);
  }

}
