import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sbsr_grad/Core/Base/BaseState.dart';
import 'package:sbsr_grad/Core/Providers/ThemeProvider.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
import 'package:sbsr_grad/Domain/UseCase/GetUserDataUseCase.dart';
import 'package:sbsr_grad/Domain/UseCase/userSignOutUseCase.dart';
import 'package:sbsr_grad/Presentation/Ui/ChangePassword/ChangePasswordView.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/ProfileTab/EditProfile/EditProfileView.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/ProfileTab/ProfileNavigator.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/ProfileTab/ProfileViewMode.dart';
import 'package:sbsr_grad/Presentation/Ui/LoginScreen/LoginView.dart';
import 'package:sbsr_grad/Presentation/Ui/Widget/ThemeSwitch.dart';

class ProfileView extends StatefulWidget {
  static const String routeName = 'ProfileView';

  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends BaseState<ProfileView, ProfileViewModel>
    implements ProfileNavigator {
  @override
  void initState() {
    super.initState();
    viewModel.loadData();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    super.build(context);
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<ProfileViewModel>(
          builder: (context, value, child) {
            if (value.user == null) {
              Center(child: Lottie.asset("assets.json/UserNotFound.json"));
            } else if (value.user != null) {
              return Scaffold(
                body: SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: goToEditProfileScreen,
                              child: const Icon(
                                Icons.edit,
                                color: MyTheme.offWhite,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          width: MediaQuery.sizeOf(context).width * 0.35,
                          height: MediaQuery.sizeOf(context).width * 0.35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80),
                              color: MyTheme.offWhite),
                          child: viewModel.user!.imageURL == null
                              ? Container(
                                  width: MediaQuery.sizeOf(context).width * 0.4,
                                  height:
                                      MediaQuery.sizeOf(context).width * 0.4,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Lottie.asset(
                                      "assets/json/UserNotFound.json"),
                                )
                              : Container(
                                  width: MediaQuery.sizeOf(context).width * 0.4,
                                  height:
                                      MediaQuery.sizeOf(context).width * 0.4,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: viewModel.user!.imageURL!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        value.user!.name,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 22),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const ThemeSwitch(),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.5,
                              decoration: BoxDecoration(
                                  color: theme.isPurple()
                                      ? MyTheme.lightPurple
                                      : MyTheme.offWhite,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      topRight: Radius.circular(25))),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Expanded(
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Email:",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayLarge!
                                                  .copyWith(
                                                    color: value.themeProvider!
                                                            .isPurple()
                                                        ? MyTheme.offWhite
                                                        : MyTheme.darkPurple,
                                                  )),
                                          Text(value.user!.email,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayLarge!
                                                  .copyWith(
                                                    color: value.themeProvider!
                                                            .isPurple()
                                                        ? MyTheme.offWhite
                                                        : MyTheme.darkPurple,
                                                  )),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Phone:",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayLarge!
                                                  .copyWith(
                                                    color: value.themeProvider!
                                                            .isPurple()
                                                        ? MyTheme.offWhite
                                                        : MyTheme.darkPurple,
                                                  )),
                                          Text(value.user!.phoneNumber,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayLarge!
                                                  .copyWith(
                                                    color: value.themeProvider!
                                                            .isPurple()
                                                        ? MyTheme.offWhite
                                                        : MyTheme.darkPurple,
                                                  )),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Gender",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayLarge!
                                                  .copyWith(
                                                    color: value.themeProvider!
                                                            .isPurple()
                                                        ? MyTheme.offWhite
                                                        : MyTheme.darkPurple,
                                                  )),
                                          Text("Male",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayLarge!
                                                  .copyWith(
                                                    color: value.themeProvider!
                                                            .isPurple()
                                                        ? MyTheme.offWhite
                                                        : MyTheme.darkPurple,
                                                  )),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const SizedBox(
                                        height: 100,
                                      ),
                                      ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      MyTheme.red)),
                                          onPressed: value.onSignOutPress,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.logout_outlined,
                                                size: 30,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(20.0),
                                                child: Text(
                                                  "Log out",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayLarge!
                                                      .copyWith(fontSize: 22),
                                                ),
                                              ),
                                            ],
                                          )),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      viewModel.themeProvider!
                                                              .isPurple()
                                                          ? MyTheme.offWhite
                                                          : MyTheme.lightGreen)),
                                          onPressed:
                                              value.goToChangePasswordScreen,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.lock,
                                                  size: 30,
                                                  color: viewModel.themeProvider!
                                                          .isPurple()
                                                      ? MyTheme.darkPurple
                                                      : MyTheme.offWhite),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(20.0),
                                                child: Text(
                                                  "Change Password",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayLarge!
                                                      .copyWith(
                                                          fontSize: 22,
                                                          color: viewModel
                                                                  .themeProvider!
                                                                  .isPurple()
                                                              ? MyTheme.darkPurple
                                                              : MyTheme.offWhite),
                                                ),
                                              ),
                                            ],
                                          )),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
            return const Center(
                child: CircularProgressIndicator(
              color: MyTheme.lightPurple,
            ));
          },
        ));
  }

  @override
  ProfileViewModel initViewModel() {
    return ProfileViewModel(
        userSignOutUseCase: injectUserSignOutUseCase(),
        getUserDataUseCase: injectGetUserDataUseCase());
  }

  @override
  goToLoginScreen() {
    Navigator.pushReplacementNamed(context, LoginScreenView.routeName);
  }

  @override
  goToEditProfileScreen() {
    Navigator.pushNamed(context, EditProfileView.routeName);
  }

  @override
  goToChangePasswordScreen() {
    Navigator.pushNamed(context, ChangePasswordView.routeName);
  }
}
