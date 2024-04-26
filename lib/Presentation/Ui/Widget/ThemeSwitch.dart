import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:sbsr_grad/Core/Providers/ThemeProvider.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    return AnimatedToggleSwitch.rolling(
      current: theme.getTheme(),
      values: const [ThemeMode.dark, ThemeMode.light],
      height: 40,
      style: ToggleStyle(
        indicatorColor: theme.isPurple() ? MyTheme.lightPurple : MyTheme.offWhite,
        borderRadius: BorderRadius.circular(15),
        backgroundColor: Colors.transparent,
        borderColor: theme.isPurple() ? MyTheme.offWhite : MyTheme.lightGreen,
      ),
      spacing: 5,
      iconBuilder: (value, foreground) {
        if (value == ThemeMode.dark) {
          return Icon(
            EvaIcons.moon,
            color: theme.isPurple() ? MyTheme.offWhite : MyTheme.lightGreen,
          );
        } else {
          return Icon(
            EvaIcons.sun,
            color: theme.isPurple() ? MyTheme.offWhite : MyTheme.lightGreen,
          );
        }
      },
      onChanged: (p0) => theme
          .changeTheme(theme.isPurple() ? ThemeMode.light : ThemeMode.dark),
      borderWidth: 1,
    );
  }
}
