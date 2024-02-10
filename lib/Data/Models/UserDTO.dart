import 'package:firebase_auth/firebase_auth.dart';
import 'package:sbsr_grad/Domain/Models/MyUser.dart';

class UserDTO {
  String uid;
  String email;
  String name;
  String phoneNumber;
  String password;

  UserDTO(
      {required this.uid, required this.email, required this.name, required this.password, required this.phoneNumber});

  UserDTO.fromFireStore(Map<String, dynamic> json) :this(
      uid: json["uid"],
      name: json["name"],
      email: json["email"],
      password: json["password"],
      phoneNumber: json["phoneNumber"]
  );

  Map<String, dynamic> toFireStore() {
    return {
      "uid": uid,
      "name": name,
      "email": email,
      "password": password,
      "phoneNumber": phoneNumber
    };
  }

  MyUser toDomain() {
    return MyUser(uid: uid,
        email: email,
        name: name,
        password: password,
        phoneNumber: phoneNumber);
  }
}