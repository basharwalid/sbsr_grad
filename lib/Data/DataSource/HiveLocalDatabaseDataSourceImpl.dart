import 'package:hive_flutter/hive_flutter.dart';
import 'package:sbsr_grad/Data/Hive/FavoriteBusDatabase.dart';
import 'package:sbsr_grad/Data/Models/HiveBusModel.dart';
import 'package:sbsr_grad/Domain/DataSource/HiveLocalDatabaseDataSource.dart';

HiveLocalDatabaseDataSource injectHiveLocalDatabaseDataSource(){
  return HiveLocalDatabaseDataSourceImpl(database: injectFavoriteBusDatabase());
}
class HiveLocalDatabaseDataSourceImpl implements HiveLocalDatabaseDataSource {
  FavoriteBusDatabase database;

  HiveLocalDatabaseDataSourceImpl({required this.database});

  @override
  Future<List<HiveBusModel>> getAllFavoriteBus() async {
    var allBusList = database.getAllFavoriteBus();
    return allBusList;
  }

  @override
  Future<void> addBusToFavorite({required HiveBusModel busModel}) async{
    await database.writeDataLocalDatabase(busModel);
  }
}
