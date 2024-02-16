import 'package:firebase_auth/firebase_auth.dart';
import 'package:sbsr_grad/Domain/Models/MyUser.dart';

class UserDTO {
  String uid;
  String email;
  String name;
  String phoneNumber;
  String password;
  String? imageURL;

  UserDTO(
      {required this.uid,
      required this.email,
      required this.name,
      required this.password,
      required this.phoneNumber,
      this.imageURL});

  UserDTO.fromFireStore(Map<String, dynamic> json)
      : this(
            uid: json["uid"],
            name: json["name"],
            email: json["email"],
            password: json["password"],
            phoneNumber: json["phoneNumber"],
            imageURL: json["imageURL"]);

  Map<String, dynamic> toFireStore() {
    return {
      "uid": uid,
      "name": name,
      "email": email,
      "password": password,
      "phoneNumber": phoneNumber,
      "imageURL": imageURL
    };
  }

  MyUser toDomain() {
    return MyUser(
        uid: uid,
        email: email,
        name: name,
        password: password,
        phoneNumber: phoneNumber,
        imageURL: imageURL!);
  }
}
