
import 'package:sbsr_grad/Data/Repository/UserRepositoryImpl.dart';
import 'package:sbsr_grad/Domain/Repository/UserRepository.dart';

UserSignOutUseCase injectUserSignOutUseCase(){
  return UserSignOutUseCase(repository: injectUserRepository());
}
class UserSignOutUseCase{
  UserRepository repository;
  UserSignOutUseCase({required this.repository});
  Future<void> invoke ()async{
    await repository.userSignOut();
  }
}