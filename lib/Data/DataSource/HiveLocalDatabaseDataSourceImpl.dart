import 'package:sbsr_grad/Data/Hive/FavoriteBusDatabase.dart';
import 'package:sbsr_grad/Domain/DataSource/HiveLocalDatabaseDataSource.dart';
import 'package:sbsr_grad/Domain/Models/Bus.dart';

HiveLocalDatabaseDataSource injectHiveLocalDatabaseDataSource() {
  return HiveLocalDatabaseDataSourceImpl(database: injectFavoriteBusDatabase());
}

class HiveLocalDatabaseDataSourceImpl implements HiveLocalDatabaseDataSource {
  FavoriteBusDatabase database;

  HiveLocalDatabaseDataSourceImpl({required this.database});

  @override
  Future<List<Bus>> getAllFavoriteBus() async {
    var response = await database.getAllFavoriteBus();
    return response.map((e) => e.toDomain()).toList();
  }


  @override
  Future<void> deleteFromLocalDatabase(
      {required int index, required Bus bus}) async {
    await database.deleteDataLocalDatabase(index, bus.toDataSource());
  }

  @override
  Future<void> addBusToFavorite({required Bus busModel})async{
    await database.writeDataLocalDatabase(busModel.toBus());
  }
}
