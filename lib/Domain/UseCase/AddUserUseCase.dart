import 'package:sbsr_grad/Data/Repository/UserRepositoryImpl.dart';
import 'package:sbsr_grad/Domain/Models/MyUser.dart';
import 'package:sbsr_grad/Domain/Repository/UserRepository.dart';
AddUserUseCase injectAddUserUseCase(){
  return AddUserUseCase(repository: injectUserRepository());
}
class AddUserUseCase{
  UserRepository repository;
  AddUserUseCase({required this.repository});

  Future<void> invoke({required MyUser myUser, required String uid})async{
    await repository.addUserToFirebaseFireStore(user: myUser, uid: uid);
  }
}