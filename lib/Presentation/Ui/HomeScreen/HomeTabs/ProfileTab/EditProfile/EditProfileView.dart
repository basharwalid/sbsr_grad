import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sbsr_grad/Core/Base/BaseState.dart';
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
    super.build(context);
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<EditProfileViewModel>(
            builder: (context, value, child) {
              if(value.user == null){
                return const Center(child: CircularProgressIndicator(),);
              }else{
                return Scaffold(
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
                              viewModel.image == null? viewModel.user!.imageURL != ""?Container(
                                width: MediaQuery.sizeOf(context).width * 0.4,
                                height: MediaQuery.sizeOf(context).width * 0.4,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(viewModel.user!.imageURL!),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(100)
                                ),
                              ):
                              Image.asset(
                                viewModel.themeProvider!.isPurple()
                                    ? "Assets/Images/DarkLogo2.png"
                                    : "Assets/Images/LightLogo2.png",
                              ):Container(
                                width: MediaQuery.sizeOf(context).width * 0.4,
                                height: MediaQuery.sizeOf(context).width * 0.4,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: FileImage(File(viewModel.image!.path)),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(100)
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 120,
                                child: InkWell(
                                  onTap: viewModel.pickImageFromGallery,
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: MyTheme.lightPurple,
                                        borderRadius:
                                        BorderRadius.circular(25)),
                                    child: const Icon(Icons.edit),
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
                );
              }
            }, ));
  }

  @override
  EditProfileViewModel initViewModel() {
    return EditProfileViewModel(
        useCase: injectUpdateUserDataUseCase(),
        userDataUseCase: injectGetUserDataUseCase());
  }
}
