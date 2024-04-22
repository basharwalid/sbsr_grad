import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sbsr_grad/Data/Models/BusDto.dart';
import 'package:sbsr_grad/Data/Repository/BusRepositoryImpl.dart';
import 'package:sbsr_grad/Domain/Models/Bus.dart';
import 'package:sbsr_grad/Domain/Repository/BusRepository.dart';

SearchForBusUseCase injectSearchForBusUseCase() {
  return SearchForBusUseCase(repository: injectBusRepository());
}

class SearchForBusUseCase {
  BusRepository repository;

  SearchForBusUseCase({required this.repository});

  Future<List<Bus>> invoke(
      {required String query}) async {
    var response =
        await repository.searchForBus(query: query);
    return response;
  }
}
