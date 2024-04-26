import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sbsr_grad/Core/Base/BaseState.dart';
import 'package:sbsr_grad/Core/Providers/ThemeProvider.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
import 'package:sbsr_grad/Domain/UseCase/GetUserDataUseCase.dart';
import 'package:sbsr_grad/Domain/UseCase/UpdateUserDataUseCase.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/ProfileTab/EditProfile/EditProfileNavigator.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/ProfileTab/EditProfile/EditProfileViewModel.dart';
import 'package:sbsr_grad/Presentation/Ui/Widget/CustomTextFormField.dart';

class EditProfileView extends StatefulWidget {
  static const String routeName = 'EditprofileView';

  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState
    extends BaseState<EditProfileView, EditProfileViewModel>
    implements EditProfileNavigator {
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
        child: Consumer<EditProfileViewModel>(
          builder: (context, value, child) {
            if (value.user == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Scaffold(
                appBar: AppBar(
                  title: Text("Edit Profile",
                      style: Theme.of(context).textTheme.displayLarge),
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Stack(
                          children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              width: MediaQuery.sizeOf(context).width * 0.35,
                              height: MediaQuery.sizeOf(context).width * 0.35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: MyTheme.offWhite),
                              child: viewModel.user!.imageURL == null
                                  ? Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.4,
                                      height: MediaQuery.sizeOf(context).width *
                                          0.4,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Lottie.asset(
                                          "assets/json/UserNotFound.json"),
                                    )
                                  : Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.4,
                                      height: MediaQuery.sizeOf(context).width *
                                          0.4,
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
                            Positioned(
                              bottom: 5,
                              left: 100,
                              child: InkWell(
                                onTap: viewModel.pickImageFromGallery,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: theme.isPurple()
                                          ? MyTheme.lightPurple
                                          : MyTheme.green,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Icon(
                                    Icons.edit,
                                    color: theme.isPurple()
                                        ? MyTheme.offWhite
                                        : MyTheme.darkGrey,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        CustomTextFormField(
                          controller: viewModel.nameController,
                          hintText: "Edit your Name",
                          prefixIcon: const Icon(EvaIcons.file_text_outline),
                          validator: viewModel.nameValidation,
                          inputType: TextInputType.name,
                          suffixIcon: const Icon(
                            Icons.edit,
                            color: MyTheme.offWhite,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                            controller: viewModel.emailController,
                            hintText: "Edit your Email",
                            prefixIcon: const Icon(Icons.email_outlined),
                            validator: viewModel.emailValidation,
                            inputType: TextInputType.emailAddress,
                            suffixIcon: const Icon(
                              Icons.edit,
                              color: MyTheme.offWhite,
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                            controller: viewModel.phoneController,
                            hintText: "Edit your phone number",
                            prefixIcon: const Icon(Icons.phone),
                            validator: viewModel.phoneValidation,
                            inputType: TextInputType.phone,
                            suffixIcon: const Icon(
                              Icons.edit,
                              color: MyTheme.offWhite,
                            )),
                        const SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                            onPressed: value.updateUserData,
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  theme.isPurple()
                                      ? MyTheme.lightPurple
                                      : MyTheme.lightGreen),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    "Save changes",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(color: MyTheme.offWhite),
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
              );
            }
          },
        ));
  }

  @override
  EditProfileViewModel initViewModel() {
    return EditProfileViewModel(
        useCase: injectUpdateUserDataUseCase(),
        userDataUseCase: injectGetUserDataUseCase());
  }
}
