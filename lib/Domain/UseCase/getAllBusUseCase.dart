
import 'package:sbsr_grad/Data/Repository/BusRepositoryImpl.dart';
import 'package:sbsr_grad/Domain/Models/Bus.dart';
import 'package:sbsr_grad/Domain/Repository/BusRepository.dart';

GetAllBusUseCase injectGetAllBusUseCase(){
  return GetAllBusUseCase(repository: injectBusRepository());
}
class GetAllBusUseCase{
  BusRepository repository;
  GetAllBusUseCase({required this.repository});

  Future<List<Bus>> invoke()async{
    var response = await repository.getAllBus();
    return response;
  }
}