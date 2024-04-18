import 'package:sbsr_grad/Data/Models/HiveBusModel.dart';
import 'package:sbsr_grad/Data/Repository/BusRepositoryImpl.dart';
import 'package:sbsr_grad/Domain/Repository/BusRepository.dart';

GetAllFavoriteBusUseCase injectGetAllFavoriteBusUseCase(){
  return GetAllFavoriteBusUseCase(repository: injectBusRepository());
}
class GetAllFavoriteBusUseCase{
  BusRepository repository;
  GetAllFavoriteBusUseCase({required this.repository});
  Future<List<HiveBusModel>> invoke()async{
    var response = await repository.getAllFavoriteBus();
    return response;
  }
}