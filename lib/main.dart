import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sbsr_grad/Core/Providers/ThemeProvider.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
import 'package:sbsr_grad/Presentation/Ui/ForgetPasswordScreen/ForgetPasswordView.dart';
import 'package:sbsr_grad/Presentation/Ui/GetStarted/IntroView.dart';
import 'package:sbsr_grad/Presentation/Ui/LoginScreen/LoginView.dart';
import 'package:sbsr_grad/Presentation/Ui/SignUpScreen/SignUpView.dart';
import 'package:sbsr_grad/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var firstTime = prefs.getBool("firstTime");
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => ThemeProvider(),
      child: MyApp(firsTime: firstTime ?? true)));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.firsTime});

  bool firsTime;
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context);
    setTheme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        IntroView.routeName: (_) => IntroView(),
        LoginScreenView.routeName: (_) => LoginScreenView(),
        SignUpView.routeName: (_) => SignUpView(),
        ForgetPasswordView.routeName: (_) => ForgetPasswordView()
      },
      initialRoute: IntroView.routeName,
      theme: MyTheme.greenTheme,
      darkTheme: MyTheme.purpleTheme,
      themeMode: themeProvider.getTheme(),
    );
  }

  Future<void> setTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var theme = preferences.getString("theme");
    themeProvider.changeTheme(
        theme == "Dark" || theme == null ? ThemeMode.dark : ThemeMode.light);
  }
}
