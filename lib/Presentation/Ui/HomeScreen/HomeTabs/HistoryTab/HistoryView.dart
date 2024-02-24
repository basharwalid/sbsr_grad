import 'package:flutter/material.dart';
import 'package:sbsr_grad/Core/Base/BaseState.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/BusTripDetailsScreen/BusTripDetailsView.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/HistoryTab/HistoryNavigator.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/HistoryTab/HistoryViewModel.dart';
import 'package:sbsr_grad/Presentation/Ui/Widget/TripsBox.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends BaseState<HistoryView, HistoryViewModel> implements HistoryNavigator {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          AppBar(
            title: Text("History"),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => Column(
                children: [
                  TripsBox(
                    callBackFunction: goToDetailsScreen,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
              itemCount: 100,
            ),
          )
        ],
      ),
    );;
  }

  @override
  HistoryViewModel initViewModel() {
    return HistoryViewModel();
  }

  goToDetailsScreen() {
    Navigator.pushNamed(context, BusTripDetailsView.routeName);
  }
}
