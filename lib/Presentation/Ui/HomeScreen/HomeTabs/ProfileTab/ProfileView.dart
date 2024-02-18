import 'dart:io';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sbsr_grad/Core/Base/BaseState.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/ProfileTab/ProfileNavigator.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/ProfileTab/ProfileViewModel.dart';
import 'package:sbsr_grad/Presentation/Ui/Widget/CustomTextFormField.dart';

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
                  child: Column(
                    children: [
                      AppBar(
                        title: const Text("Profile"),
                      ),
                      Stack(
                        children: [
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
                          Positioned(
                            bottom: 10,
                            left: 120,
                            child: InkWell(
                              onTap: viewModel.pickImageFromGallery,
                              child: Container(
                                height: 40,
                                width: 40,
                                child: const Icon(Icons.edit),
                                decoration: BoxDecoration(
                                    color: MyTheme.lightPurple,
                                    borderRadius: BorderRadius.circular(25)),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Edit your Info",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),

                    ],
                  ),
                )
        )
    );
  }

  @override
  ProfileViewModel initViewModel() {
    return ProfileViewModel();
  }
}
