import 'package:sbsr_grad/Core/Base/BaseViewModel.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/FavoriteTab/FavoriteNavigator.dart';

class FavoriteViewModel extends BaseViewModel<FavoriteNavigator>{

  goToDetailsScreen(){
    navigator!.goToDetailsScreen();
  }
}