import 'package:flutter/material.dart';
import 'package:sbsr_grad/Core/Base/BaseNavigator.dart';
import 'package:sbsr_grad/Core/Providers/AppConfigProvider.dart';
import 'package:sbsr_grad/Core/Providers/ThemeProvider.dart';

class BaseViewModel<N extends BaseNavigator> extends ChangeNotifier {
  N? navigator;
  ThemeProvider? themeProvider;
  ThemeData? theme;
  AppConfigProvider? provider;
}
