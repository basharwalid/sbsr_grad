import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sbsr_grad/Core/Base/BaseState.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
import 'package:sbsr_grad/Domain/Models/Bus.dart';
import 'package:sbsr_grad/Domain/UseCase/getAllBusUseCase.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/BusTripDetailsScreen/BusTripDetailsView.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/BusTripTab/BusTripNavigator.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/BusTripTab/BusTripViewModel.dart';
import 'package:sbsr_grad/Presentation/Ui/Widget/TripsBox.dart';

class BusTripView extends StatefulWidget {
  const BusTripView({super.key});

  @override
  State<BusTripView> createState() => _BusTripViewState();
}

class _BusTripViewState extends BaseState<BusTripView, BusTripViewModel>
    implements BusTripNavigator {
  @override
  void initState() {
    super.initState();
    viewModel.getAllBus();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ChangeNotifierProvider<BusTripViewModel>(
        create: (context) => viewModel,
        child: Column(
          children: [
            AppBar(
              surfaceTintColor: Colors.transparent,
              title: const Text("Bus Trips List"),
            ),
            const SizedBox(
              height: 20,
            ),
            SearchBar(
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(
                  MyTheme.lightPurple.withOpacity(0.5)),
              hintText: "Search",
              hintStyle: MaterialStateProperty.all(
                Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: MyTheme.offWhite),
              ),
              leading: const Icon(Icons.search , color: MyTheme.offWhite,),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 12 , vertical: 8)),
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<BusTripViewModel>(
              builder: (context, value, child) => Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Column(
                    children: [
                      BusTripDetailsContainer(
                        callBackFunction: value.goToDetailsScreen,
                        bus: value.allBusList[index],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                  itemCount: value.allBusList.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  BusTripViewModel initViewModel() {
    return BusTripViewModel(useCase: injectGetAllBusUseCase());
  }

  @override
  goToDetailsScreen({required Bus bus}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => BusTripDetailsView(bus: bus,),));
  }


}
