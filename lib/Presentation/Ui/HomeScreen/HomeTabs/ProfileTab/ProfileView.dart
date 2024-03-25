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
                physics: const FixedExtentScrollPhysics(),
                child: SafeArea(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          AppBar(
                            actions: [
                              InkWell(
                                  onTap: goToEditScreen,
                                  child: const Icon(
                                    Icons.edit,
                                    color: MyTheme.offWhite,
                                    size: 30,
                                  )),
                            ],
                            flexibleSpace: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                children: [
                                  Text(
                                    "Profile",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(fontSize: 22),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 12),
                                    decoration: const BoxDecoration(
                                        color: MyTheme.darkPurple,
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(25),
                                            bottomLeft: Radius.circular(25))),
                                    height: MediaQuery.of(context).size.height *
                                        0.35,
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      children: [
                                        Container(
                                          clipBehavior: Clip.antiAlias,
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
                                          height:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(1000),
                                              color: MyTheme.offWhite),
                                          child: viewModel.user!.imageURL ==
                                                  null
                                              ? Lottie.asset(
                                                  "assets/json/UserNotFound.json")
                                              : CachedNetworkImage(
                                                  imageUrl:
                                                      viewModel.user!.imageURL!,
                                                  fit: BoxFit.cover,
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
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: MyTheme.purple.withOpacity(0.4),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25))),
                            height: MediaQuery.of(context).size.height *0.5 ,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20 , right: 20 ,left: 20 , bottom: 20),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Text(
                                       "Email:",
                                       style: Theme.of(context)
                                           .textTheme
                                           .displayLarge
                                     ),
                                     Text(
                                       value.user!.email,
                                       style: Theme.of(context)
                                           .textTheme
                                           .displayLarge
                                     ),
                                   ],
                                 ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Phone:",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge
                                      ),
                                      Text(
                                        value.user!.phoneNumber,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Gender",
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge
                                      ),
                                      Text(
                                          "Male",
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge
                                      ),
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
                                            padding: const EdgeInsets.all(20.0),
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
                                  const SizedBox(height: 20,),
                                  ElevatedButton(
                                      onPressed: (){},
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.logout_outlined,
                                            size: 30,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Text(
                                              "Change password",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayLarge!
                                                  .copyWith(fontSize: 22),
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          )
                        ],
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
  goToEditScreen() {
    Navigator.pushNamed(context, EditProfileView.routeName);
  }
}
// Column(
//   children: [
//     AppBar(
//       title: const Text("Profile"),
//       actions: [
//         InkWell(
//             onTap: goToEditScreen,
//             child: const Icon(
//               Icons.edit,
//               color: MyTheme.offWhite,
//               size: 30,
//             )),
//       ],
//     ),
//     const SizedBox(
//       height: 10,
//     ),
//     Container(
//       clipBehavior: Clip.antiAlias,
//       width: MediaQuery.sizeOf(context).width * 0.4,
//       height: MediaQuery.sizeOf(context).width * 0.4,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(1000),
//           color: MyTheme.offWhite),
//       child: viewModel.user!.imageURL == null
//           ? Lottie.asset(
//           "assets/json/UserNotFound.json")
//           : CachedNetworkImage(
//         imageUrl: viewModel.user!.imageURL!,
//         fit: BoxFit.cover,
//       ),
//     ),
//     const SizedBox(
//       height: 30,
//     ),
//     UserDetailsProfileContainer(
//         preIcon: EvaIcons.file_text_outline,
//         title: value.user!.name),
//     const SizedBox(
//       height: 20,
//     ),
//     UserDetailsProfileContainer(
//       preIcon: Icons.call_rounded,
//       title: value.user!.phoneNumber,
//     ),
//     const SizedBox(
//       height: 20,
//     ),
//     UserDetailsProfileContainer(
//       preIcon: Icons.email_outlined,
//       title: value.user!.email,
//     ),
//     const SizedBox(
//       height: 20,
//     ),
//     ElevatedButton(
//         style: ButtonStyle(
//             backgroundColor:
//                 MaterialStateProperty.all(MyTheme.red)),
//         onPressed: value.onSignOutPress,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(
//               Icons.logout_outlined,
//               size: 25,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Text(
//                 "Log out",
//                 style:
//                     Theme.of(context).textTheme.displayLarge,
//               ),
//             ),
//           ],
//         )),
//   ],
// ),
