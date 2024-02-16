import 'package:flutter/material.dart';
import 'package:sbsr_grad/Core/Base/BaseState.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/MapTab/MapNavigator.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/MapTab/MapViewModel.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends BaseState<MapView, MapViewModel> implements MapNavigator {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  MapViewModel initViewModel() {
    return MapViewModel();
  }
}
