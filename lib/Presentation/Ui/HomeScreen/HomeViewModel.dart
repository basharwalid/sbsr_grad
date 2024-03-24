import 'package:flutter/material.dart';
import 'package:sbsr_grad/Core/Base/BaseViewModel.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/BusTripTab/BusTripView.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/FavoriteTab/FavoriteView.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/MapTab/MapView.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/ProfileTab/ProfileView.dart';

class HomeViewModel extends BaseViewModel{
  int currentIndex = 0;
  List<Widget> tabsList = [
    const MapView(),
    const BusTripView(),
    const FavoriteView(),
    const ProfileView(),
  ];

  changeSelectedIndex(int selectedIndex){
    currentIndex = selectedIndex;
    notifyListeners();
  }
}