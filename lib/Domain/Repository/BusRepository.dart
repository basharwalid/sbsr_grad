import 'package:sbsr_grad/Data/Models/HiveBusModel.dart';
import 'package:sbsr_grad/Domain/Models/Bus.dart';

abstract class BusRepository{
  Future<List<Bus>> getAllBus();
  Future<List<HiveBusModel>> getAllFavoriteBus();
  Future<void> addBusToFavorite({required HiveBusModel busModel});
}