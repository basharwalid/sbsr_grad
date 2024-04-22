import 'package:sbsr_grad/Domain/Models/Bus.dart';

abstract class BusRepository {
  Future<List<Bus>> getAllBus();

  Future<List<Bus>> getAllFavoriteBus();

  Future<void> addBusToFavorite({required Bus busModel});

  Future<List<Bus>> searchForBus({required String query});

  Future<void> deleteFromLocalDatabase({required int index , required Bus bus});
}
