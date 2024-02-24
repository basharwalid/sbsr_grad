import 'package:sbsr_grad/Core/Base/BaseViewModel.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/BusTripTab/BusTripNavigator.dart';

class BusTripViewModel extends BaseViewModel<BusTripNavigator>{
  goToDetailsScreen(){
    navigator!.goToDetailsScreen();
  }

}