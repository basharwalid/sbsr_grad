import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sbsr_grad/Core/Providers/AppConfigProvider.dart';
import 'package:sbsr_grad/Core/Providers/ThemeProvider.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
import 'package:sbsr_grad/Presentation/Ui/ForgetPasswordScreen/ForgetPasswordView.dart';
import 'package:sbsr_grad/Presentation/Ui/GetStarted/IntroView.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeView.dart';
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

  var user = FirebaseAuth.instance.currentUser;

  var firstTime = prefs.getBool("firstTime");
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ThemeProvider(),),
    ChangeNotifierProvider(create: (context) => AppConfigProvider(user: user),)
  ],
    child: MyApp(firsTime: firstTime ?? true, user: user),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.firsTime, this.user});

  bool firsTime;
  User? user;
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
        ForgetPasswordView.routeName: (_) => ForgetPasswordView(),
        HomeView.routeName: (_) => HomeView(),
      },
      initialRoute: user == null? IntroView.routeName: HomeView.routeName,
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
