import 'package:flutter/material.dart';

class MyTheme {
  static const Color darkPurple = Color(0xff16132A);
  static const Color purple = Color(0xff37306B);
  static const Color lightPurple = Color(0xff5E53B8);
  static const Color offWhite = Color(0xffFEFFE8);
  static const Color white = Color(0xffFFFFFF);
  static const Color lightGreen = Color(0xff1EBE5C);
  static const Color green = Color(0xff2FDD46);
  static const Color darkGrey = Color(0xff252525);
  static const Color orange = Color(0xffEE930F);
  static const Color red = Color(0xffF73645);
  static const Color darkRed = Color(0xffD30010);

  static ThemeData purpleTheme = ThemeData(
      primaryColor: lightPurple,
      scaffoldBackgroundColor: darkPurple,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(offWhite),
              backgroundColor: MaterialStateProperty.all(lightPurple),
              elevation: MaterialStateProperty.all(0),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
              textStyle: MaterialStateProperty.all(const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: offWhite)
              )
          ),
      ),
      textTheme: const TextTheme(
        displaySmall: TextStyle(
          fontSize: 12,
          color: offWhite,
        ),
        displayMedium: TextStyle(
            fontSize: 16,
            color: offWhite
        ),
        displayLarge: TextStyle(
            fontSize: 20,
            color: offWhite
        ),
      ),

      appBarTheme:const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: offWhite,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: offWhite,
          ),
          actionsIconTheme: IconThemeData(color: offWhite)
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: purple,
          elevation: 0,
          selectedItemColor: offWhite,
          type: BottomNavigationBarType.fixed,
          enableFeedback: true,
          showSelectedLabels: false,
          showUnselectedLabels: false
      )
  );

  static ThemeData greenTheme = ThemeData(
      primaryColor: lightGreen,
      scaffoldBackgroundColor: darkGrey,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(offWhite),
              backgroundColor: MaterialStateProperty.all(lightPurple),
              elevation: MaterialStateProperty.all(0),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
              textStyle: MaterialStateProperty.all(const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: offWhite)
              )
          )
      ),
      textTheme: const TextTheme(
          displaySmall: TextStyle(
            fontSize: 12,
            color: offWhite,
          ),
          displayMedium: TextStyle(
              fontSize: 16,
              color: offWhite
          ),
          displayLarge: TextStyle(
              fontSize: 20,
              color: offWhite
          )
      ),
      appBarTheme:const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: offWhite,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: offWhite,
          ),
          actionsIconTheme: IconThemeData(color: offWhite)
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: lightGreen,
          elevation: 0,
          selectedItemColor: offWhite,
          type: BottomNavigationBarType.fixed,
          enableFeedback: true,
          showSelectedLabels: false,
          showUnselectedLabels: false
      )
  );
}
