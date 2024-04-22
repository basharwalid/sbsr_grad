import 'package:sbsr_grad/Data/Models/BusDto.dart';
import 'package:sbsr_grad/Domain/Models/Bus.dart';

abstract class FirebaseBusDatabaseRemoteDataSource{
  Future<List<Bus>> getAllBus();
  Future<List<Bus>> searchForBus({required String query});
}