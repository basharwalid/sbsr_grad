import 'package:sbsr_grad/Data/Models/UserDTO.dart';

class MyUser {
  String uid;
  String email;
  String name;
  String phoneNumber;
  String password;

  MyUser(
      {required this.uid,
        required this.email,
      required this.name,
      required this.password,
      required this.phoneNumber});

  UserDTO toDataSource() {
    return UserDTO(
        uid: uid,
        email: email,
        name: name,
        password: password,
        phoneNumber: phoneNumber);
  }
}
