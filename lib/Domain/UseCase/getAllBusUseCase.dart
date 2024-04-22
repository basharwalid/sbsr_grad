
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
    var favoriteBuses = await repository.getAllFavoriteBus();
    response = getFavoriteBuses(response, favoriteBuses);
    return response;
  }

  List<Bus> getFavoriteBuses(List<Bus> allBusList , List<Bus> favoriteBusList){
    for(int i=0; i<allBusList.length; i++){
      for(int j=0; j<favoriteBusList.length; j++){
          if(allBusList[i].busName == favoriteBusList[j].busName){
            allBusList[i].isFavorite = true;
            allBusList[i].favoriteIndex = j;
          }
      }
    }
    return allBusList;
  }
}