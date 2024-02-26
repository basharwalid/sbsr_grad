import 'package:sbsr_grad/Data/Models/UserDTO.dart';

class MyUser {
  String email;
  String name;
  String phoneNumber;
  String password;
  String? imageURL;

  MyUser(
      {required this.email,
      required this.name,
      required this.password,
      required this.phoneNumber,
      this.imageURL});

  UserDTO toDataSource() {
    return UserDTO(
        email: email,
        name: name,
        password: password,
        phoneNumber: phoneNumber,
        imageURL: imageURL);
  }
}
