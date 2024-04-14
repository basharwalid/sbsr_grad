
import 'package:sbsr_grad/Core/Base/BaseViewModel.dart';
import 'package:sbsr_grad/Domain/Exceptions/FirebaseBusException.dart';
import 'package:sbsr_grad/Domain/Models/Bus.dart';
import 'package:sbsr_grad/Domain/UseCase/getAllBusUseCase.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/BusTripTab/BusTripNavigator.dart';

class BusTripViewModel extends BaseViewModel<BusTripNavigator> {
  GetAllBusUseCase useCase;
  String? errorMessage;
  bool loading = true;
  List<Bus> allBusList = [];
  List<Bus> searchResults = [];
  BusTripViewModel({required this.useCase});

  goToDetailsScreen(Bus bus) {
    navigator!.goToDetailsScreen(bus: bus);
  }

  void getAllBus() async {
    loading = true;
    allBusList = [];
    errorMessage = null;
    notifyListeners();
    try {
      allBusList = await useCase.invoke();
      loading = false;
      notifyListeners();
    } on FirebaseBusException catch (e) {
      errorMessage = e.errorMessage;
      loading = false;
      notifyListeners();
    }
  }

}
