import 'dart:ui';

abstract class BaseNavigator {
  showLoadingMessage({required String message});

  showSuccessMessage({required String message,
    String? posActionTitle,
    VoidCallback? posAction,
    String? negActionTitle,
    VoidCallback? negAction,
    required Color backgroundColor
  });

  showFailMessage(
      {required String message, String? posActionTitle,
        VoidCallback? posAction,
        String? negActionTitle,
        VoidCallback? negAction,
        required Color backgroundColor });
  goBack();
  showQuestionMessage({
    required String message ,
    String? posActionTitle ,
    VoidCallback? posAction,
    String? negativeActionTitle,
    VoidCallback? negativeAction
  });
}
