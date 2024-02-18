import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sbsr_grad/Core/Base/BaseState.dart';
import 'package:sbsr_grad/Domain/UseCase/ResetPasswordUseCase.dart';
import 'package:sbsr_grad/Presentation/Ui/ForgetPasswordScreen/ForgetPasswordNavigator.dart';
import 'package:sbsr_grad/Presentation/Ui/ForgetPasswordScreen/ForgetPasswordViewModel.dart';
import 'package:sbsr_grad/Presentation/Ui/LoginScreen/LoginView.dart';
import 'package:sbsr_grad/Presentation/Ui/Widget/CustomTextFormField.dart';

class ForgetPasswordView extends StatefulWidget {
  static const String routeName = 'ForgetPassword';

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState
    extends BaseState<ForgetPasswordView, ForgetPasswordViewModel>
    implements ForgetPasswordNavigator {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: viewModel.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset("assets/json/forgetPassword.json"),
                Text(
                  "Forget Password",
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 28),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Text(
                      "Please Enter Your Email",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                    controller: viewModel.emailController,
                    hintText: "Email",
                    prefixIcon: const Icon(Icons.email_outlined),
                    validator: viewModel.emailValidation,
                    inputType: TextInputType.emailAddress),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    onPressed: viewModel.resetPassword,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Send",
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  goToLoginScreen() {
    Navigator.pushReplacementNamed(context, LoginScreenView.routeName);
  }

  @override
  ForgetPasswordViewModel initViewModel() {
    return ForgetPasswordViewModel(resetPasswordUseCase: injectResetPasswordUseCase());
  }
}
