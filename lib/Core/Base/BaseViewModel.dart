import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sbsr_grad/Core/Base/BaseNavigator.dart';
import 'package:sbsr_grad/Core/Errors/FirebaseAuthExceptionHandler.dart';
import 'package:sbsr_grad/Core/Errors/FirebaseFireStoreErrorHandler.dart';
import 'package:sbsr_grad/Core/Errors/FirebaseImageDatabaseExceptionsHandler.dart';
import 'package:sbsr_grad/Core/Errors/FirebaseLoginErrorHandler.dart';
import 'package:sbsr_grad/Core/Providers/AppConfigProvider.dart';
import 'package:sbsr_grad/Core/Providers/ThemeProvider.dart';
import 'package:sbsr_grad/Domain/Exceptions/CacheException.dart';
import 'package:sbsr_grad/Domain/Exceptions/FirebaseAuthException.dart';
import 'package:sbsr_grad/Domain/Exceptions/FirebaseImageException.dart';
import 'package:sbsr_grad/Domain/Exceptions/FirebaseLoginException.dart';
import 'package:sbsr_grad/Domain/Exceptions/FirebaseUserDatabaseException.dart';
import 'package:sbsr_grad/Domain/Exceptions/InternetConnectionException.dart';
import 'package:sbsr_grad/Domain/Exceptions/PermissionDeniedException.dart';
import 'package:sbsr_grad/Domain/Exceptions/TimeOutOperationsException.dart';
import 'package:sbsr_grad/Domain/Exceptions/URLLauncherException.dart';

class BaseViewModel<N extends BaseNavigator> extends ChangeNotifier {
  N? navigator;
  ThemeProvider? themeProvider;
  ThemeData? theme;
  AppConfigProvider? provider;

  XFile? image;

  Future<void> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      this.image = image;
      notifyListeners();
    }
  }

  Future<void> pickImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    var image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      this.image = image;
      notifyListeners();
    }
  }

  String handleExceptions(Exception e) {
    if (e is CacheException) {
      return "Unable To LoadDate";
    } else if (e is FirebaseImageException) {
      return FirebaseImageDatabaseExceptionsHandler
          .handleFirebaseImageDatabaseExceptionsEnglish(e.toString());
    } else if (e is FirebaseLoginException) {
      return FirebaseLoginErrorHandler.handleLoginErrorEnglish(e.errorMessage);
    } else if (e is FirebaseUserAuthException) {
      return FirebaseAuthExceptionHandler.handleFirebaseAuthExceptionEnglish(
          error: e.errorMessage);
    } else if (e is FirebaseFireStoreDatabaseException) {
      return FirebaseFireStoreErrorHandler.handleFirebaseFireStoreErrorEnglish(
          e.errorMessage);
    } else if (e is InternetConnectionException) {
      return "check Your Internet Connection";
    } else if (e is PermissionDeniedException) {
      return "permission Denied";
    } else if (e is TimeOutOperationsException) {
      return "operation TimedOut";
    } else if (e is URLLauncherException) {
      return "url Launching Error";
    } else {
      return "someThing Went Wrong";
    }
  }
}
