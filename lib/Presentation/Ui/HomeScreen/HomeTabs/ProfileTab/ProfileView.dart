import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sbsr_grad/Core/Base/BaseState.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
import 'package:sbsr_grad/Domain/UseCase/GetUserDataUseCase.dart';
import 'package:sbsr_grad/Domain/UseCase/userSignOutUseCase.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/ProfileTab/EditProfile/EditProfileView.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/ProfileTab/ProfileNavigator.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/ProfileTab/ProfileViewMode.dart';
import 'package:sbsr_grad/Presentation/Ui/LoginScreen/LoginView.dart';
import 'package:sbsr_grad/Presentation/Ui/Widget/CustomField.dart';
import 'package:sbsr_grad/Presentation/Ui/Widget/UserData.dart';

class ProfileView extends StatefulWidget {
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
    super.build(context);
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<ProfileViewModel>(
          builder: (context, value, child) {
            if (value.user == null) {
              Center(child: Lottie.asset("assets.json/UserNotFound.json"));
            } else if (value.user != null) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      AppBar(
                        title: const Text("Profile"),
                        actions: [
                          InkWell(
                              onTap: goToEditScreen,
                              child: const Icon(
                                Icons.edit,
                                color: MyTheme.offWhite,
                                size: 30,
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          clipBehavior: Clip.antiAlias,
                          width: MediaQuery.sizeOf(context).width * 0.39,
                          height: MediaQuery.sizeOf(context).width * 0.39,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1000),
                              color: MyTheme.offWhite),
                          child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            imageUrl: viewModel.provider!.getUser()!.photoURL!,
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      UserDetailsProfileContainer(
                          preIcon: EvaIcons.file_text_outline,
                          title: value.user!.name),
                      const SizedBox(
                        height: 20,
                      ),
                      UserDetailsProfileContainer(
                        preIcon: Icons.call_rounded,
                        title: value.user!.phoneNumber,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      UserDetailsProfileContainer(
                        preIcon: Icons.email_outlined,
                        title: value.user!.email,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(MyTheme.red)),
                          onPressed: value.onSignOutPress,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.logout_outlined,
                                size: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "Log out",
                                  style:
                                      Theme.of(context).textTheme.displayLarge,
                                ),
                              ),
                            ],
                          )),
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
  goToEditScreen() {
    Navigator.pushNamed(context, EditProfileView.routeName);
  }
}
