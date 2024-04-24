import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sbsr_grad/Core/Base/BaseViewModel.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
import 'package:sbsr_grad/Domain/Exceptions/FirebaseBusException.dart';
import 'package:sbsr_grad/Domain/Models/Bus.dart';
import 'package:sbsr_grad/Domain/UseCase/AddBusToFavoriteUseCase.dart';
import 'package:sbsr_grad/Domain/UseCase/DeleteBusFromFavoriteUseCase.dart';
import 'package:sbsr_grad/Domain/UseCase/SearchForBusUseCase.dart';
import 'package:sbsr_grad/Domain/UseCase/getAllBusUseCase.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/BusTripTab/BusTripNavigator.dart';

class BusTripViewModel extends BaseViewModel<BusTripNavigator> {
  GetAllBusUseCase useCase;
  AddBusToFavoriteUseCase addBusToFavoriteUseCase;
  SearchForBusUseCase searchForBusUseCase;
  DeleteBusFromFavoriteUseCase deleteBusFromFavoriteUseCase;
  String? errorMessage;
  bool loading = true;
  List<Bus> allBusList = [];
  List<Bus> buses = [];
  List<Bus> searchResults = [];
  List<Bus> allFavoriteBusList = [];
  bool isSelected = false;
  TextEditingController searchController = TextEditingController();

  BusTripViewModel(
      {required this.useCase,
      required this.addBusToFavoriteUseCase,
      required this.searchForBusUseCase,
      required this.deleteBusFromFavoriteUseCase});

  goToDetailsScreen(Bus bus) {
    navigator!.goToDetailsScreen(bus: bus);
  }

  void getAllBus() async {
    loading = true;
    allBusList = [];
    buses = [];
    errorMessage = null;
    notifyListeners();
    try {
      allBusList = await useCase.invoke();
      buses = copyList(allBusList);
      loading = false;
      notifyListeners();
    } on FirebaseBusException catch (e) {
      errorMessage = e.errorMessage;
      loading = false;
      notifyListeners();
    }
  }

  List<Bus> copyList(List<Bus> busList) {
    List<Bus> copy = [];
    for (int i = 0; i < busList.length; i++) {
      copy.add(busList[i]);
    }
    return copy;
  }

  void searchForBus(String query) async {
    buses =
        allBusList.where((element) => element.from.contains(query)).toList();
    if (buses.isEmpty) {
      buses = allBusList
          .where((element) =>
              element.from.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  Future<void> addBusToFavorite(Bus busModel) async {
    try {
      busModel.isFavorite = true;
      await addBusToFavoriteUseCase.invoke(busModel);
      navigator!.showSuccessMessage(
          message: "bus Added Successfully", backgroundColor: MyTheme.green, posActionTitle: "OK");
      notifyListeners();
    } catch (error) {
      errorMessage = error.toString();
    }
  }

  Future<void> deleteBusFromFavorite(Bus bus) async {
    try {
      bus.isFavorite = false;
      await deleteBusFromFavoriteUseCase.invoke(bus: bus, index: bus.favoriteIndex);
      notifyListeners();
      navigator!.showSuccessMessage(
          message: "Bus removed Successfully",
          backgroundColor: MyTheme.green,
          posActionTitle: "Ok"
      );
    } catch (error) {
      errorMessage = error.toString();
    }
  }

  Future<void> favoriteState(Bus bus) async {
    final index = buses.indexWhere((existingBus) => existingBus.uid == bus.uid); // Assuming 'id' is unique
    if (index != -1) {
      if (bus.isFavorite) {
        await deleteBusFromFavorite(bus);// Use the object from the list
      } else {
        await addBusToFavorite(buses[index]); // Use the object from the list
      }
    }
    notifyListeners();
  }
}
