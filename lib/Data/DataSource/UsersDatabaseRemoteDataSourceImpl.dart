import 'package:sbsr_grad/Data/Firebase/UsersDatabase.dart';
import 'package:sbsr_grad/Data/Models/UserDTO.dart';
import 'package:sbsr_grad/Domain/DataSource/UsersDatabaseRemoteDataSource.dart';

class UsersDatabaseRemoteDataSourceImpl
    implements UsersDatabaseRemoteDataSource {
  UsersDatabase database;

  UsersDatabaseRemoteDataSourceImpl({required this.database});

  @override
  Future<void> addUser(UserDTO userDTO) async {
    await database.addUser(userDTO);
  }
}
