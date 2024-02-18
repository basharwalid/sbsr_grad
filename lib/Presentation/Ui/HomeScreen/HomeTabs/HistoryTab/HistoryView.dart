import 'package:flutter/material.dart';
import 'package:sbsr_grad/Core/Base/BaseState.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/HistoryTab/HistoryNavigator.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/HistoryTab/HistoryViewModel.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends BaseState<HistoryView, HistoryViewModel> implements HistoryNavigator {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  HistoryViewModel initViewModel() {
    return HistoryViewModel();
  }
}
