import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sbsr_grad/Data/Repository/UserRepositoryImpl.dart';
import 'package:sbsr_grad/Domain/Models/MyUser.dart';
import 'package:sbsr_grad/Domain/Repository/UserRepository.dart';

CreateAccountUseCase injectCreateAccountUseCase() {
  return CreateAccountUseCase(repository: injectUserRepository());
}

class CreateAccountUseCase {
  UserRepository repository;

  CreateAccountUseCase({required this.repository});

  Future<User> invoke({XFile? file,required MyUser user}) async {
    var response = await repository.createUserInFirebaseAuth(user);
    if(file!=null){
      var image = await repository.uploadUserImage(image: file);
      user.imageURL = image;
      response = await repository.updateUserPhoto(photo: image);
    }
    user.password = "Private";
    await repository.addUserToFirebaseFireStore(user: user , uid: response.uid);
    return response;
  }
}
