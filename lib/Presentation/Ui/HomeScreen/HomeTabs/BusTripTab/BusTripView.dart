import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sbsr_grad/Core/Base/BaseState.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
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
            backgroundColor: MaterialStateProperty.all(MyTheme.lightPurple.withOpacity(0.5)),
            hintText: "Search",
            leading: const Icon(CupertinoIcons.search),
            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 12)),
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
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => Column(
                children: [
                  TripsBox(
                    callBackFunction: goToDetailsScreen,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
              itemCount: 10,
            ),
          )
        ],
      ),
    );
  }

  @override
  BusTripViewModel initViewModel() {
    return BusTripViewModel();
  }

  @override
  goToDetailsScreen() {
    Navigator.pushNamed(context, BusTripDetailsView.routeName);
  }

}
