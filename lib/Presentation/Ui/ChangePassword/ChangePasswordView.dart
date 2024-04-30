import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sbsr_grad/Core/Base/BaseState.dart';
import 'package:sbsr_grad/Core/Providers/ThemeProvider.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
import 'package:sbsr_grad/Domain/UseCase/UpdateUserPasswordUseCase.dart';
import 'package:sbsr_grad/Presentation/Ui/ChangePassword/ChangePasswordNavigator.dart';
import 'package:sbsr_grad/Presentation/Ui/ChangePassword/ChangePasswordViewModel.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/ProfileTab/EditProfile/EditProfileView.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/ProfileTab/ProfileView.dart';
import 'package:sbsr_grad/Presentation/Ui/Widget/CustomPasswordTextFormField.dart';

class ChangePasswordView extends StatefulWidget {
  static const String routeName = 'Change-password';

  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState
    extends BaseState<ChangePasswordView, ChangePasswordViewModel>
    implements ChangePasswordNavigator {
  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    super.build(context);
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Change password",
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        body: Form(
          key: viewModel.formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  theme.isPurple()
                      ? Lottie.asset("assets/json/forgetPassword.json")
                      : Lottie.asset("assets/json/forgetPasswordGreen.json"),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomPasswordTextFormField(
                      controller: viewModel.passwordController,
                      hintText: "Enter Your Password",
                      prefixIcon: const Icon(EvaIcons.lock),
                      validator: viewModel.passwordValidation,
                      inputType: TextInputType.visiblePassword),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomPasswordTextFormField(
                      controller: viewModel.newPasswordController,
                      hintText: "Enter new password",
                      prefixIcon: const Icon(EvaIcons.lock),
                      validator: viewModel.passwordValidation,
                      inputType: TextInputType.visiblePassword),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomPasswordTextFormField(
                      controller: viewModel.newPasswordConfirmationController,
                      hintText: "Confirm new password",
                      prefixIcon: const Icon(EvaIcons.lock),
                      validator: viewModel.passwordConfirmationValidation,
                      inputType: TextInputType.visiblePassword),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                      onPressed: viewModel.updatePassword,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(theme.isPurple()
                            ? MyTheme.lightPurple
                            : MyTheme.lightGreen),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "Update Password",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(color: MyTheme.offWhite),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  ChangePasswordViewModel initViewModel() {
    return ChangePasswordViewModel(useCase: injectUpdateUserPasswordUseCase());
  }

  @override
  void goToProfileScreen() {
    Navigator.pushReplacementNamed(context, ProfileView.routeName);
  }
}
