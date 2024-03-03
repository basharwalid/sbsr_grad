import 'package:flutter/material.dart';
import 'package:sbsr_grad/Core/Base/BaseState.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
import 'package:sbsr_grad/Domain/UseCase/getAllBusUseCase.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/BusTripDetailsScreen/BusTripDetailsNavigator.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/BusTripDetailsScreen/BusTripDetailsViewModel.dart';

class BusTripDetailsView extends StatefulWidget {
  static const String routeName = "BusTripDetailsView";
  const BusTripDetailsView({super.key});

  @override
  State<BusTripDetailsView> createState() => _BusTripDetailsViewState();
}

class _BusTripDetailsViewState extends BaseState<BusTripDetailsView, BusTripDetailsViewModel> implements BusTripDetailsNavigator{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset("assets/images/logo.png", width: 100, height: 100,),
            const SizedBox(
              height: 30,
            ),
            Text("Bus Details",style: Theme.of(context).textTheme.displayLarge),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: MyTheme.purple,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  Text(viewModel.allBusList.map((bus) => bus.busName).toString(), style: Theme.of(context).textTheme.displayMedium),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(viewModel.allBusList.map((e) => e.from).toString(), style: Theme.of(context).textTheme.displayMedium,),
                      Text("Station 3 : Obour City Third distract ", style: Theme.of(context).textTheme.displaySmall,),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(viewModel.allBusList.map((e) => e.to).toString(), style: Theme.of(context).textTheme.displayMedium,),
                      Text("station 11 : Fifth Settlement Elnarges", style: Theme.of(context).textTheme.displaySmall,),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(viewModel.allBusList.map((e) => e.nextStation).toString(), style: Theme.of(context).textTheme.displayMedium,),
                      Text("station 3", style: Theme.of(context).textTheme.displaySmall,),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text("Est. time to arrive :", style: Theme.of(context).textTheme.displayMedium,),
                      Text("12 min", style: Theme.of(context).textTheme.displaySmall,),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: MyTheme.white,
                        width: 2,
                      )
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text("Remind me when the bus is near the station", style: Theme.of(context).textTheme.displayMedium)
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  BusTripDetailsViewModel initViewModel() {
    return BusTripDetailsViewModel(useCase: injectGetAllBusUseCase());
  }
}
