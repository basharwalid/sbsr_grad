import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sbsr_grad/Core/Base/BaseState.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
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
              leading: const Icon(CupertinoIcons.search),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 12)),
            ),
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   height: 50,
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(25),
            //     color: MyTheme.purple,
            //   ),
            //   child: Row(
            //     children: [
            //       const Icon(Icons.search_outlined, size: 30, color: MyTheme.lightPurple,),
            //       const SizedBox(
            //         width: 20,
            //       ),
            //       Text("Search", style: Theme.of(context).textTheme.displayLarge,),
            //     ],
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
            Consumer<BusTripViewModel>(
              builder: (context, value, child) => Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Column(
                    children: [
                      BusTripDetailsContainer(
                        callBackFunction: (){},
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
  goToDetailsScreen() {
    Navigator.pushNamed(context, BusTripDetailsView.routeName);
  }
}
