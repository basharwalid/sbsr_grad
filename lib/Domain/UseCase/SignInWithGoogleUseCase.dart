import 'package:firebase_auth/firebase_auth.dart';
import 'package:sbsr_grad/Data/Repository/UserRepositoryImpl.dart';
import 'package:sbsr_grad/Domain/DataSource/FirebaseUserAuthRemoteDataSource.dart';
import 'package:sbsr_grad/Domain/Repository/UserRepository.dart';


SignInWithGoogleUseCase injectSignInWithGoogleUseCase(){
  return SignInWithGoogleUseCase(repository: injectUserRepository());
}
class SignInWithGoogleUseCase {
  UserRepository repository;

  SignInWithGoogleUseCase({required this.repository});

  Future<User> invoke() async {
    var response = await repository.signInWithGoogle();
    return response;
  }
}
