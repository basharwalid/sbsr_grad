import 'package:sbsr_grad/Data/Repository/UserRepositoryImpl.dart';
import 'package:sbsr_grad/Domain/Repository/UserRepository.dart';

UpdateUserPasswordUseCase injectUpdateUserPasswordUseCase(){
  return UpdateUserPasswordUseCase(repository: injectUserRepository());
}

class UpdateUserPasswordUseCase{
  UserRepository repository;
  UpdateUserPasswordUseCase({required this.repository});

  Future<void> invoke({required String newPassword})async{
    await repository.updateUserPassword(newPassword: newPassword);
  }
}