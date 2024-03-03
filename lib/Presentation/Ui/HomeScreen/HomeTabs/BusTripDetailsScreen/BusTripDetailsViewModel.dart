import 'package:sbsr_grad/Core/Base/BaseViewModel.dart';
import 'package:sbsr_grad/Domain/Exceptions/FirebaseBusException.dart';
import 'package:sbsr_grad/Domain/Models/Bus.dart';
import 'package:sbsr_grad/Domain/UseCase/getAllBusUseCase.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/BusTripDetailsScreen/BusTripDetailsNavigator.dart';

class BusTripDetailsViewModel extends BaseViewModel<BusTripDetailsNavigator>{
  GetAllBusUseCase useCase;
  List<Bus> allBusList = [];
  String? errorMessage;
  bool loading = true;
  BusTripDetailsViewModel({required this.useCase});

  getBusData()async{
    loading = true;
    allBusList = [];
    errorMessage = null;
    notifyListeners();
    try{
      allBusList = await useCase.invoke();
      loading = false;
      notifyListeners();
    }on FirebaseBusException catch(e){
        errorMessage = e.errorMessage;
        loading = false;
        notifyListeners();
    }
  }
}