import 'package:sbsr_grad/Core/Base/BaseViewModel.dart';
import 'package:sbsr_grad/Domain/Exceptions/FirebaseBusException.dart';
import 'package:sbsr_grad/Domain/Models/Bus.dart';
import 'package:sbsr_grad/Domain/UseCase/getAllBusUseCase.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/BusTripDetailsScreen/BusTripDetailsNavigator.dart';

class BusTripDetailsViewModel extends BaseViewModel<BusTripDetailsNavigator>{
  GetAllBusUseCase useCase;
  late Bus bus;
  List<Bus> allBusList = [];
  String? errorMessage;
  bool loading = true;
  BusTripDetailsViewModel({required this.useCase});

  loadBusData()async{

  }
}