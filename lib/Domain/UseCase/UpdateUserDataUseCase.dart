import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sbsr_grad/Data/Repository/UserRepositoryImpl.dart';
import 'package:sbsr_grad/Domain/Models/MyUser.dart';
import 'package:sbsr_grad/Domain/Repository/UserRepository.dart';

UpdateUserDataUseCase inejctUpdateUserDataUseCase(){
  return UpdateUserDataUseCase(repository: injectUserRepository());
}
UpdateUserDataUseCase injectUpdateUserDataUseCase(){
  return UpdateUserDataUseCase(repository: injectUserRepository());
}
class UpdateUserDataUseCase{
  UserRepository repository;
  UpdateUserDataUseCase({required this.repository});

  Future<User> invoke({required MyUser user ,required String uid , required XFile file})async{
    var response = await repository.updateUserData(user: user, uid: uid);
    return response;
  }
}