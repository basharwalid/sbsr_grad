import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sbsr_grad/Core/Base/BaseState.dart';
import 'package:sbsr_grad/Core/Notifications/NotificationsManager.dart';
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
  void initState() {
    super.initState();
    if (!mounted) return;
    viewModel.askUserForPermissionAndService();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: SafeArea(
        child: Scaffold(
          body: Consumer<MapViewModel>(
            builder: (context, value, child) => Column(children: [
              Expanded(
                child: Stack(children: [
                  GoogleMap(
                    markers: viewModel.markerList.toSet(),
                    mapType: MapType.normal,
                    initialCameraPosition: viewModel.myHome,
                    onMapCreated: (GoogleMapController controller) {
                      viewModel.mapController = controller;
                      viewModel.drawUserMarker();
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SearchBar(
                      textStyle: MaterialStateProperty.all(Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              color: value.themeProvider!.isPurple()
                                  ? MyTheme.offWhite
                                  : MyTheme.darkGrey)),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(8)),
                      backgroundColor: MaterialStateProperty.all(
                          value.themeProvider!.isPurple()
                              ? MyTheme.purple
                              : MyTheme.offWhite),
                      leading: Icon(
                        Icons.search,
                        color: value.themeProvider!.isPurple()
                            ? MyTheme.offWhite
                            : MyTheme.darkPurple,
                      ),
                      hintText: "Search for a Station",
                      hintStyle: MaterialStateProperty.all(Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              color: value.themeProvider!.isPurple()
                                  ? MyTheme.offWhite
                                  : MyTheme.darkPurple,
                              fontSize: 14)),
                      onChanged: (query) async {
                        if (query.isNotEmpty) {
                          await value.searchMarkers(query);
                        }
                      },
                      // onTap: placesAutoCompleteTextField(),
                    ),
                  ),
                ]),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  @override
  MapViewModel initViewModel() {
    return MapViewModel();
  }
}
