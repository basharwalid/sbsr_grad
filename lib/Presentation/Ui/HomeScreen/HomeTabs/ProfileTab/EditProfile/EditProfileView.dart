import 'dart:io';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sbsr_grad/Core/Base/BaseState.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
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
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<EditProfileViewModel>(
            builder: (context, value, child) => Scaffold(
                  appBar: AppBar(
                    title: const Text("Edit Profile"),
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
                                width: MediaQuery.sizeOf(context).width * 0.4,
                                height: MediaQuery.sizeOf(context).width * 0.4,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(1000),
                                    color: MyTheme.offWhite),
                                child: viewModel.image == null
                                    ? Lottie.asset(
                                        "assets/json/UserNotFound.json")
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
                                        borderRadius:
                                            BorderRadius.circular(25)),
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
                            hintText: "Name",
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
                              hintText: "Email address",
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
                              hintText: "Phone number",
                              prefixIcon: const Icon(Icons.call_rounded),
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
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    MyTheme.lightPurple),
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
                                          .displayLarge,
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
                )));
  }

  @override
  EditProfileViewModel initViewModel() {
    return EditProfileViewModel();
  }
}
