import 'package:sbsr_grad/Data/Models/UserDTO.dart';

abstract class UsersDatabaseRemoteDataSource{
  Future<void> addUser(UserDTO userDTO);
}