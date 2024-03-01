import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sbsr_grad/Core/Base/BaseState.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/MapTab/MapNavigator.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/MapTab/MapViewModel.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends BaseState<MapView, MapViewModel>
    implements MapNavigator {
  @override
  Widget build(BuildContext context) {
    viewModel.askUserForPermissionAndService();
    super.build(context);
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Expanded(
            child: Stack(children: [
              GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: viewModel.myHome,
                onMapCreated: (GoogleMapController controller) {
                  viewModel.mapController = controller;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SearchBar(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
                  backgroundColor: MaterialStateProperty.all(MyTheme.purple),
                  leading: const Icon(Icons.search , color: MyTheme.offWhite,),
                  hintText: "Search for a Station",
                  hintStyle: MaterialStateProperty.all(Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: MyTheme.offWhite,fontSize: 14)),
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }

  @override
  MapViewModel initViewModel() {
    return MapViewModel();
  }
}
