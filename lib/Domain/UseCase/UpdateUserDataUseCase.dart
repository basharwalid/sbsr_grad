import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sbsr_grad/Data/Repository/UserRepositoryImpl.dart';
import 'package:sbsr_grad/Domain/Models/MyUser.dart';
import 'package:sbsr_grad/Domain/Repository/UserRepository.dart';

UpdateUserDataUseCase injectUpdateUserDataUseCase() {
  return UpdateUserDataUseCase(repository: injectUserRepository());
}

class UpdateUserDataUseCase {
  UserRepository repository;

  UpdateUserDataUseCase({required this.repository});

  Future<User> invoke(
      {required MyUser user, required String uid, required XFile? file}) async {
    if (file != null) {
      var response = await repository.uploadUserImage(image: file);
      await repository.uploadUserImage(image: file);
      user.imageURL = response;
    }
    var response = await repository.updateUserDisplayName(name: user.name);
    var userExist = await repository.userExist(uid: uid);
    if (userExist) {
      await repository.updateUserData(user: user, uid: uid);
    } else {
      await repository.createUserInFirebaseAuth(user);
    }
    return response;
  }
}
