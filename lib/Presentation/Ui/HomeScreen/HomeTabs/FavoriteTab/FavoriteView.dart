import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sbsr_grad/Core/Base/BaseState.dart';
import 'package:sbsr_grad/Domain/UseCase/AddBusToFavoriteUseCase.dart';
import 'package:sbsr_grad/Domain/UseCase/DeleteBusFromFavoriteUseCase.dart';
import 'package:sbsr_grad/Domain/UseCase/getAllFavoriteBusUseCase.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/BusTripDetailsScreen/BusTripDetailsView.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/FavoriteTab/FavoriteNavigator.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/FavoriteTab/FavoriteViewModel.dart';
import 'package:sbsr_grad/Presentation/Ui/Widget/BusTripDetailsContainer.dart';
import 'package:sbsr_grad/Presentation/Ui/Widget/FavoriteBusContainer.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends BaseState<FavoriteView, FavoriteViewModel>
    implements FavoriteNavigator {
  @override
  void initState() {
    super.initState();
    viewModel.getAllFavoriteBus();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ChangeNotifierProvider<FavoriteViewModel>(
        create: (context) => viewModel,
        builder: (context, child) =>
            Column(
              children: [
                AppBar(
                  surfaceTintColor: Colors.transparent,
                  title: const Text("Favorites"),
                ),
                const SizedBox(
                  height: 20,
                ),
                Consumer<FavoriteViewModel>(
                  builder: (context, value, child) =>
                      Expanded(
                        child: ListView.builder(
                          itemCount: value.allFavoriteBusList.length,
                          itemBuilder: (context, index) =>
                              Column(
                                children: [
                                  FavoriteBusContainer(
                                    callBackFunction: value.goToDetailsScreen,
                                    hiveBusModel: value
                                        .allFavoriteBusList[index],
                                    favoriteCallBack: value.deleteBusFromFavorite,
                                  ),
                                  const SizedBox(height: 20,)
                                ],
                              ),

                        ),
                      ),
                )
              ],
            ),
      ),
    );
  }

  @override
  FavoriteViewModel initViewModel() {
    return FavoriteViewModel(useCase: injectGetAllFavoriteBusUseCase(),
        deleteBusFromFavoriteUseCase: injectDeleteBusFromFavoriteUseCase());
  }

  @override
  goToDetailsScreen() {
    Navigator.pushNamed(context, BusTripDetailsView.routeName);
  }


}
