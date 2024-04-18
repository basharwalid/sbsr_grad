import 'package:sbsr_grad/Data/DataSource/FirebaseBusDatabaseRemoteDataSourceImpl.dart';
import 'package:sbsr_grad/Data/DataSource/HiveLocalDatabaseDataSourceImpl.dart';
import 'package:sbsr_grad/Data/Models/HiveBusModel.dart';
import 'package:sbsr_grad/Domain/DataSource/FirebaseBusDatabaseRemoteDataSource.dart';
import 'package:sbsr_grad/Domain/DataSource/HiveLocalDatabaseDataSource.dart';
import 'package:sbsr_grad/Domain/Models/Bus.dart';
import 'package:sbsr_grad/Domain/Repository/BusRepository.dart';


BusRepository injectBusRepository() {
  return BusRepositoryImpl(
      remoteDataSource: injectFirebaseBusDatabaseRemoteDataSourceImpl(),
      localDatabaseDataSource: injectHiveLocalDatabaseDataSource());
}

class BusRepositoryImpl implements BusRepository {
  FirebaseBusDatabaseRemoteDataSource remoteDataSource;
  HiveLocalDatabaseDataSource localDatabaseDataSource;

  BusRepositoryImpl(
      {required this.remoteDataSource, required this.localDatabaseDataSource});

  @override
  Future<List<Bus>> getAllBus() async {
    var response = await remoteDataSource.getAllBus();
    return response;
  }

  @override
  Future<List<HiveBusModel>> getAllFavoriteBus() async {
    var response = await localDatabaseDataSource.getAllFavoriteBus();
    return response;
  }

  @override
  Future<void> addBusToFavorite({required HiveBusModel busModel})async{
    await localDatabaseDataSource.addBusToFavorite(busModel: busModel);
  }


}