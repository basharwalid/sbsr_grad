
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sbsr_grad/Data/Repository/UserRepositoryImpl.dart';
import 'package:sbsr_grad/Domain/Repository/UserRepository.dart';

SignInWithEmailAndPasswordUseCase injectSignInWithEmailAndPasswordUseCase(){
  return SignInWithEmailAndPasswordUseCase(repository: injectUserRepository());
}
class SignInWithEmailAndPasswordUseCase{
  UserRepository repository;

  SignInWithEmailAndPasswordUseCase({required this.repository});
    Future<User> invoke({required String email ,required String password})async{
    var response = await repository.signInWithEmailAndPassword(email: email, password: password);
    return response;
  }
}