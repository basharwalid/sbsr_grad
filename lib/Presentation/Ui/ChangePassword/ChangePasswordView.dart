import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sbsr_grad/Core/Base/BaseState.dart';
import 'package:sbsr_grad/Domain/UseCase/UpdateUserPasswordUseCase.dart';
import 'package:sbsr_grad/Presentation/Ui/ChangePassword/ChangePasswordNavigator.dart';
import 'package:sbsr_grad/Presentation/Ui/ChangePassword/ChangePasswordViewModel.dart';

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
          child: Column(
            children: [
                Lottie.asset("assets/json/")
            ],
          ),
        ),
      ),
    );
  }

  @override
  ChangePasswordViewModel initViewModel() {
    return ChangePasswordViewModel(useCase: injectUpdateUserPasswordUseCase());
  }
}
