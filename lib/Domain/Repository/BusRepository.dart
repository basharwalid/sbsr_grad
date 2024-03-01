import 'package:sbsr_grad/Domain/Models/Bus.dart';

abstract class BusRepository{
  Future<List<Bus>> getAllBus();
}