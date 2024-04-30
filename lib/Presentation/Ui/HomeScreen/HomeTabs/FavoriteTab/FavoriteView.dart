import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sbsr_grad/Core/Base/BaseState.dart';
import 'package:sbsr_grad/Core/Providers/ThemeProvider.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
import 'package:sbsr_grad/Domain/UseCase/DeleteBusFromFavoriteUseCase.dart';
import 'package:sbsr_grad/Domain/UseCase/getAllFavoriteBusUseCase.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/BusTripDetailsScreen/BusTripDetailsView.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/FavoriteTab/FavoriteNavigator.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/FavoriteTab/FavoriteViewModel.dart';
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
    var theme = Provider.of<ThemeProvider>(context);
    super.build(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ChangeNotifierProvider<FavoriteViewModel>(
        create: (context) => viewModel,
        builder: (context, child) => Column(
          children: [
            AppBar(
              surfaceTintColor: Colors.transparent,
              title: const Text("Favorites"),
            ),
            const SizedBox(
              height: 20,
            ),
            // viewModel.allFavoriteBusList.isEmpty
            //     ? Column(
            //         children: [
            //           theme.isPurple()
            //               ? Lottie.asset("assets/json/Empty.json")
            //               : Lottie.asset("assets/json/EmptyGreen.json"),
            //           const SizedBox(
            //             height: 20,
            //           ),
            //           Text(
            //             "Your Favorite List is Empty",
            //             style: Theme.of(context)
            //                 .textTheme
            //                 .displayLarge!
            //                 .copyWith(color: MyTheme.offWhite),
            //           )
            //         ],
            //       )
            Consumer<FavoriteViewModel>(
              builder: (context, value, child) => Expanded(
                child: ListView.builder(
                    itemCount: value.allFavoriteBusList.length,
                    itemBuilder: (context, index) => Column(
                          children: [
                            FavoriteBusContainer(
                              callBackFunction: value.goToDetailsScreen,
                              hiveBusModel: value.allFavoriteBusList[index],
                              favoriteCallBack: value.deleteBusFromFavorite,
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        )),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  FavoriteViewModel initViewModel() {
    return FavoriteViewModel(
        useCase: injectGetAllFavoriteBusUseCase(),
        deleteBusFromFavoriteUseCase: injectDeleteBusFromFavoriteUseCase());
  }

  @override
  goToDetailsScreen() {
    Navigator.pushNamed(context, BusTripDetailsView.routeName);
  }
}
