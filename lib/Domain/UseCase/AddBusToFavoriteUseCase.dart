import 'package:sbsr_grad/Data/Models/HiveBusModel.dart';
import 'package:sbsr_grad/Data/Repository/BusRepositoryImpl.dart';
import 'package:sbsr_grad/Domain/Repository/BusRepository.dart';

AddBusToFavoriteUseCase injectAddBusToFavoriteUseCase(){
  return AddBusToFavoriteUseCase(repository: injectBusRepository());
}
class AddBusToFavoriteUseCase {
  BusRepository repository;
  AddBusToFavoriteUseCase({required this.repository});

  Future<void> invoke(HiveBusModel busModel)async{
    await repository.addBusToFavorite(busModel: busModel);
  }
}