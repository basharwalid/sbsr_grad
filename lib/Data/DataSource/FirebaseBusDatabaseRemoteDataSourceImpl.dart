import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sbsr_grad/Data/Firebase/FirebaseBusDatabase.dart';
import 'package:sbsr_grad/Data/Models/BusDto.dart';
import 'package:sbsr_grad/Domain/DataSource/FirebaseBusDatabaseRemoteDataSource.dart';
import 'package:sbsr_grad/Domain/Exceptions/FirebaseUserDatabaseException.dart';
import 'package:sbsr_grad/Domain/Models/Bus.dart';

FirebaseBusDatabaseRemoteDataSource
    injectFirebaseBusDatabaseRemoteDataSourceImpl() {
  return FirebaseBusDatabaseRemoteDataSourceImpl(
      database: injectFirebaseBusDatabase());
}

class FirebaseBusDatabaseRemoteDataSourceImpl
    implements FirebaseBusDatabaseRemoteDataSource {
  FirebaseBusDatabase database;

  FirebaseBusDatabaseRemoteDataSourceImpl({required this.database});

  @override
  Future<List<Bus>> getAllBus() async {
    try {
      var response = await database.getAllBus();
      return response.map((e) => e.toDomain()).toList();
    } on FirebaseException catch (e) {
      throw FirebaseFireStoreDatabaseException(errorMessage: e.code);
    }
  }

  @override
  Future<List<Bus>> searchForBus({required String query}) async{
    var response = await database.searchForBus(query: query);
    return response.map((e) => e.toDomain()).toList();
  }


}
