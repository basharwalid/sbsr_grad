import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:sbsr_grad/Core/Base/BaseState.dart';
import 'package:sbsr_grad/Core/Providers/ThemeProvider.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeNavigator.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeViewModel.dart';

class HomeView extends StatefulWidget {
  static const String routeName = "Home";

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView, HomeViewModel>
    implements HomeNavigator {
  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    super.build(context);
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<HomeViewModel>(
        builder: (context, value, child) => Scaffold(
          resizeToAvoidBottomInset: false,
          body: viewModel.tabsList[viewModel.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: value.currentIndex,
            items: [
              BottomNavigationBarItem(
                  label: "Map",
                  icon: Icon(
                    EvaIcons.pin_outline,
                    size: 30,
                    color:
                        theme.isPurple() ? MyTheme.offWhite : MyTheme.darkGrey,
                  ),
                  activeIcon: Icon(
                    EvaIcons.pin,
                    size: 30,
                    color: theme.isPurple()
                        ? MyTheme.darkPurple
                        : MyTheme.offWhite,
                  )),
              BottomNavigationBarItem(
                  label: "Bus Trips",
                  icon: Icon(
                    Bootstrap.list,
                    size: 30,
                    color:
                        theme.isPurple() ? MyTheme.offWhite : MyTheme.darkGrey,
                  ),
                  activeIcon: Icon(
                    Bootstrap.list,
                    size: 30,
                    color: theme.isPurple()
                        ? MyTheme.darkPurple
                        : MyTheme.offWhite,
                  )),
              BottomNavigationBarItem(
                  label: "History",
                  icon: Icon(
                    Bootstrap.heart,
                    size: 25,
                    color:
                        theme.isPurple() ? MyTheme.offWhite : MyTheme.darkGrey,
                  ),
                  activeIcon: Icon(
                    Bootstrap.heart_fill,
                    size: 25,
                    color: theme.isPurple()
                        ? MyTheme.darkPurple
                        : MyTheme.offWhite,
                  )),
              BottomNavigationBarItem(
                  label: "Profile",
                  icon: Icon(
                    EvaIcons.person_outline,
                    size: 30,
                    color:
                        theme.isPurple() ? MyTheme.offWhite : MyTheme.darkGrey,
                  ),
                  activeIcon: Icon(
                    Bootstrap.person,
                    size: 30,
                    color: theme.isPurple()
                        ? MyTheme.darkPurple
                        : MyTheme.offWhite,
                  )),
            ],
            onTap: (value) {
              viewModel.changeSelectedIndex(value);
            },
          ),
        ),
      ),
    );
  }

  @override
  initViewModel() {
    return HomeViewModel();
  }
}
