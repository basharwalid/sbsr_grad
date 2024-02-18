
import 'package:sbsr_grad/Data/Repository/UserRepositoryImpl.dart';
import 'package:sbsr_grad/Domain/Repository/UserRepository.dart';

ResetPasswordUsecase injectResetPasswordUseCase(){
  return ResetPasswordUsecase(repository: injectUserRepository());
}
class ResetPasswordUsecase{
  UserRepository repository;
  ResetPasswordUsecase({required this.repository});

  Future<void> invoke({required String email})async{
    await repository.resetPassword(email: email);
  }
}