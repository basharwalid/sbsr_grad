import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sbsr_grad/Core/Base/BaseNavigator.dart';
import 'package:sbsr_grad/Core/Base/BaseViewModel.dart';
import 'package:sbsr_grad/Core/Providers/AppConfigProvider.dart';
import 'package:sbsr_grad/Core/Providers/ThemeProvider.dart';
import 'package:sbsr_grad/Core/Utils/Dialog.dart';

abstract class BaseState<T extends StatefulWidget, VM extends BaseViewModel>
    extends State<T> implements BaseNavigator {
  late VM viewModel;

  VM initViewModel();

  @override
  void initState() {
    super.initState();
    viewModel = initViewModel();
    viewModel.provider = Provider.of<AppConfigProvider>(context, listen: false);
    viewModel.navigator = this;
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.navigator = null;
  }

  @override
  Widget build(BuildContext context) {
    viewModel.themeProvider = Provider.of<ThemeProvider>(context);
    viewModel.theme = Theme.of(context);
    return const SizedBox();
  }

  @override
  goBack() {
    Navigator.pop(context);
  }

  @override
  showLoadingMessage({required String message}) {
    MyDialog.showLoadingDialog(context: context, message: message);
  }

  @override
  showSuccessMessage(
      {required String message,
      String? posActionTitle,
      VoidCallback? posAction,
      String? negActionTitle,
      VoidCallback? negAction,
      required Color backgroundColor}) {
    MyDialog.showSuccessMessage(
        context: context,
        message: message,
        posActionTitle: posActionTitle,
        posAction: posAction,
        negativeActionTitle: negActionTitle,
        negativeAction: negAction,
        backgroundColor: backgroundColor);
  }

  @override
  showFailMessage(
      {required String message,
      String? posActionTitle,
      VoidCallback? posAction,
      String? negActionTitle,
      VoidCallback? negAction,
      required Color backgroundColor}) {
    MyDialog.showFailMessage(
        context: context,
        message: message,
        backgroundColor: backgroundColor,
        posActionTitle: posActionTitle,
        posAction: posAction,
        negativeActionTitle: negActionTitle,
        negativeAction: negAction);
  }

  @override
  showQuestionMessage(
      {required String message,
      String? posActionTitle,
      VoidCallback? posAction,
      String? negativeActionTitle,
      VoidCallback? negativeAction,
        required Color backgroundColor
      }) {
    MyDialog.showQuestionMessage(context: context, message: message,
      posAction: posAction,
      posActionTitle: posActionTitle,
      negativeAction: negativeAction,
      negativeActionTitle: negativeActionTitle,
      backgroundColor: backgroundColor,
    );
  }
}
