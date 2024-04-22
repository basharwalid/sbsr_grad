import 'package:sbsr_grad/Data/Repository/BusRepositoryImpl.dart';
import 'package:sbsr_grad/Domain/Models/Bus.dart';
import 'package:sbsr_grad/Domain/Repository/BusRepository.dart';

GetAllFavoriteBusUseCase injectGetAllFavoriteBusUseCase() {
  return GetAllFavoriteBusUseCase(repository: injectBusRepository());
}

class GetAllFavoriteBusUseCase {
  BusRepository repository;

  GetAllFavoriteBusUseCase({required this.repository});

  Future<List<Bus>> invoke() async {
    var response = await repository.getAllFavoriteBus();
    return response;
  }
}
