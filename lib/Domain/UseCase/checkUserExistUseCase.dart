import 'package:sbsr_grad/Data/Repository/UserRepositoryImpl.dart';
import 'package:sbsr_grad/Domain/Repository/UserRepository.dart';


CheckIfUserExistUseCase inejctCheckIfUserExistUseCase(){
  return CheckIfUserExistUseCase(repository: injectUserRepository());
}
class CheckIfUserExistUseCase {

  UserRepository repository;
  CheckIfUserExistUseCase ({required this.repository});

  Future<bool> invoke({required String uid})async {
    var response = await repository.userExist(uid: uid);
    return response;
  }
}