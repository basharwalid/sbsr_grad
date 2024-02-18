import 'package:flutter/material.dart';
import 'package:sbsr_grad/Core/Base/BaseState.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/BusTripTab/BusTripNavigator.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/BusTripTab/BusTripViewModel.dart';

class BusTripView extends StatefulWidget {
  const BusTripView({super.key});

  @override
  State<BusTripView> createState() => _BusTripViewState();
}

class _BusTripViewState extends BaseState<BusTripView, BusTripViewModel>
    implements BusTripNavigator {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  BusTripViewModel initViewModel() {
    return BusTripViewModel();
  }
}
