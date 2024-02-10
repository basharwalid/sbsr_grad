import 'package:firebase_auth/firebase_auth.dart';
import 'package:sbsr_grad/Domain/Models/MyUser.dart';
import 'package:sbsr_grad/Domain/Repository/UserRepository.dart';

class CreateAccountUseCase {
  UserRepository repository;

  CreateAccountUseCase(this.repository);

  Future<User> invoke(
      {required String email,
      required String name,
      required String password,
      required String phoneNumber}) async {
    var response = await repository.createUserFirebaseFireStore(MyUser(
        uid: '',
        email: email,
        password: password,
        phoneNumber: phoneNumber,
        name: name));
    return response;
  }
}