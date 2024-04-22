import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sbsr_grad/Core/Base/BaseViewModel.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
import 'package:sbsr_grad/Domain/Models/Bus.dart';
import 'package:sbsr_grad/Domain/UseCase/AddBusToFavoriteUseCase.dart';
import 'package:sbsr_grad/Domain/UseCase/DeleteBusFromFavoriteUseCase.dart';
import 'package:sbsr_grad/Domain/UseCase/getAllBusUseCase.dart';
import 'package:sbsr_grad/Domain/UseCase/getAllFavoriteBusUseCase.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/FavoriteTab/FavoriteNavigator.dart';

class FavoriteViewModel extends BaseViewModel<FavoriteNavigator> {
  GetAllFavoriteBusUseCase useCase;
  bool loading = false;
  String? errorMessage;
  List<Bus> allFavoriteBusList = [];

  DeleteBusFromFavoriteUseCase deleteBusFromFavoriteUseCase;

  FavoriteViewModel(
      {required this.useCase,
      required this.deleteBusFromFavoriteUseCase});

  goToDetailsScreen() {
    navigator!.goToDetailsScreen();
  }

  void getAllFavoriteBus() async {
    loading = true;
    errorMessage = null;
    allFavoriteBusList = [];
    try {
      allFavoriteBusList = await useCase.invoke();
      loading = false;
      notifyListeners();
    } on FirebaseException catch (error) {
      errorMessage = error.message;
      loading = false;
      notifyListeners();
      return null;
    } on TimeoutException catch (error) {
      errorMessage = error.message;
      loading = false;
      notifyListeners();
    }
  }


  Future<void> deleteBusFromFavorite(Bus bus) async {
    try {
      bus.isFavorite = false;
      await deleteBusFromFavoriteUseCase.invoke(
          bus: bus, index: bus.favoriteIndex);
      navigator!.showSuccessMessage(
          message: "bus removed Successfully",
          backgroundColor: MyTheme.green,
          posActionTitle: "OK");
      notifyListeners();
    } catch (error) {
      errorMessage = error.toString();
    }
    notifyListeners();
  }
}
