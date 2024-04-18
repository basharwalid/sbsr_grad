import 'dart:js_interop';

import 'package:sbsr_grad/Core/Base/BaseViewModel.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
import 'package:sbsr_grad/Data/Models/HiveBusModel.dart';
import 'package:sbsr_grad/Domain/UseCase/getAllFavoriteBusUseCase.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/FavoriteTab/FavoriteNavigator.dart';

class FavoriteViewModel extends BaseViewModel<FavoriteNavigator> {
  GetAllFavoriteBusUseCase useCase;

  FavoriteViewModel({required this.useCase});

  goToDetailsScreen() {
    navigator!.goToDetailsScreen();
  }

  Future<List<HiveBusModel>?> getAllFavoriteBus() async {
    try {
      var response = await useCase.invoke();
      return response;
    } catch (error) {
      navigator!.showFailMessage(message: error.toString(), backgroundColor: MyTheme.red);
      notifyListeners();
      return null;
    }
  }
}
