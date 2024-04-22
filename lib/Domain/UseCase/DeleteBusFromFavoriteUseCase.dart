import 'package:sbsr_grad/Data/Repository/BusRepositoryImpl.dart';
import 'package:sbsr_grad/Domain/Models/Bus.dart';
import 'package:sbsr_grad/Domain/Repository/BusRepository.dart';

DeleteBusFromFavoriteUseCase injectDeleteBusFromFavoriteUseCase(){
  return DeleteBusFromFavoriteUseCase(repository: injectBusRepository());
}
class DeleteBusFromFavoriteUseCase{
  BusRepository repository;
  DeleteBusFromFavoriteUseCase({required this.repository});

  Future<void> invoke({required int index,required Bus bus})async{
    await repository.deleteFromLocalDatabase(index: index , bus: bus);
  }
}