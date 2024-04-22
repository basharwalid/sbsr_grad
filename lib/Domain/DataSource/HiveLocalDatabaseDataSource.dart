import 'package:sbsr_grad/Domain/Models/Bus.dart';

abstract class HiveLocalDatabaseDataSource {
  Future<List<Bus>> getAllFavoriteBus();
  Future<void> addBusToFavorite({required Bus busModel});
  Future<void> deleteFromLocalDatabase({required int index , required Bus bus});
}
