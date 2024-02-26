
import 'package:sbsr_grad/Data/Repository/UserRepositoryImpl.dart';
import 'package:sbsr_grad/Domain/Models/MyUser.dart';
import 'package:sbsr_grad/Domain/Repository/UserRepository.dart';

GetUserDataUseCase injectGetUserDataUseCase(){
  return GetUserDataUseCase(repository: injectUserRepository());
}
class GetUserDataUseCase{
  UserRepository repository;
  GetUserDataUseCase({required this.repository});

  Future<MyUser?> invoke({required String uid})async{
    var user = await repository.getUser(uid: uid);
    return user;
  }
}