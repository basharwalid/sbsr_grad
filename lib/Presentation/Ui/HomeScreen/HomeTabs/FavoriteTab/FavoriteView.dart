import 'package:flutter/material.dart';
import 'package:sbsr_grad/Core/Base/BaseState.dart';
import 'package:sbsr_grad/Domain/UseCase/getAllFavoriteBusUseCase.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/BusTripDetailsScreen/BusTripDetailsView.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/FavoriteTab/FavoriteNavigator.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/FavoriteTab/FavoriteViewModel.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends BaseState<FavoriteView, FavoriteViewModel> implements FavoriteNavigator {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          AppBar(
            surfaceTintColor: Colors.transparent,
            title: const Text("Favorites"),
          ),
          const SizedBox(
            height: 20,
          ),

        ],
      ),
    );
  }

  @override
  FavoriteViewModel initViewModel() {
    return FavoriteViewModel(useCase: injectGetAllFavoriteBusUseCase());
  }

  @override
  goToDetailsScreen() {
    Navigator.pushNamed(context, BusTripDetailsView.routeName);
  }


}
