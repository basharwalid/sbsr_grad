import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sbsr_grad/Core/Base/BaseNavigator.dart';
import 'package:sbsr_grad/Core/Providers/AppConfigProvider.dart';
import 'package:sbsr_grad/Core/Providers/ThemeProvider.dart';

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
}
