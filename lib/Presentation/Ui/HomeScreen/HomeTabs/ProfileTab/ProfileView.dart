import 'dart:io';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sbsr_grad/Core/Base/BaseState.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
import 'package:sbsr_grad/Domain/UseCase/userSignOutUseCase.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/ProfileTab/EditProfile/EditProfileView.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/ProfileTab/ProfileNavigator.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/ProfileTab/ProfileViewMode.dart';
import 'package:sbsr_grad/Presentation/Ui/LoginScreen/LoginView.dart';
import 'package:sbsr_grad/Presentation/Ui/Widget/CustomField.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends BaseState<ProfileView, ProfileViewModel>
    implements ProfileNavigator {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<ProfileViewModel>(
            builder: (context, value, child) => SingleChildScrollView(
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
                          width: MediaQuery.sizeOf(context).width * 0.4,
                          height: MediaQuery.sizeOf(context).width * 0.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1000),
                              color: MyTheme.offWhite),
                          child: viewModel.image == null
                              ? Lottie.asset("assets/json/UserNotFound.json")
                              : Image.file(File(viewModel.image!.path),
                                  fit: BoxFit.cover),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomField(preIcon: EvaIcons.file_text_outline,title:"Nardin"),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomField(preIcon:Icons.call_rounded ,title: "01283195130",),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomField(preIcon:Icons.email_outlined ,title: "nardinwagih14@gmail.com",),
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge,
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                )));
  }

  @override
  ProfileViewModel initViewModel() {
    return ProfileViewModel(userSignOutUseCase: injectUserSignOutUseCase());
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
