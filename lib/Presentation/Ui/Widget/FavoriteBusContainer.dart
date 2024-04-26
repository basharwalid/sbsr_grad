import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:sbsr_grad/Core/Providers/ThemeProvider.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
import 'package:sbsr_grad/Domain/Models/Bus.dart';

class FavoriteBusContainer extends StatefulWidget {
  Function callBackFunction;
  Bus hiveBusModel;

  Function favoriteCallBack;

  FavoriteBusContainer(
      {required this.callBackFunction,
      super.key,
      required this.hiveBusModel,
      required this.favoriteCallBack});

  @override
  State<FavoriteBusContainer> createState() => _FavoriteBusContainerState();
}

class _FavoriteBusContainerState extends State<FavoriteBusContainer> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    return InkWell(
      onTap: () => widget.callBackFunction(widget.hiveBusModel),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: theme.isPurple() ? MyTheme.lightPurple : MyTheme.offWhite,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 30,
                      color: theme.isPurple()
                          ? MyTheme.offWhite
                          : MyTheme.darkPurple,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "From:",
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                color: theme.isPurple()
                                    ? MyTheme.offWhite
                                    : MyTheme.darkPurple,
                              ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.hiveBusModel.from,
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                color: theme.isPurple()
                                    ? MyTheme.offWhite
                                    : MyTheme.darkPurple,
                              ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      LineAwesome.flag_solid,
                      size: 30,
                      color: theme.isPurple()
                          ? MyTheme.offWhite
                          : MyTheme.darkPurple,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "To: ",
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                color: theme.isPurple()
                                    ? MyTheme.offWhite
                                    : MyTheme.darkPurple,
                              ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.hiveBusModel.to,
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                color: theme.isPurple()
                                    ? MyTheme.offWhite
                                    : MyTheme.darkPurple,
                              ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                ),
                color: theme.isPurple()
                    ? MyTheme.offWhite
                    : MyTheme.lightGreen,
              ),
              width: 50,
              height: 50,
              child: InkWell(
                borderRadius:
                    const BorderRadius.only(topRight: Radius.circular(20)),
                onTap: () {
                  widget.favoriteCallBack(widget.hiveBusModel);
                },
                child: widget.hiveBusModel.isFavorite
                    ? Icon(LineAwesome.heart,
                        size: 30,
                        color: theme.isPurple()
                            ? MyTheme.lightPurple
                            : MyTheme.offWhite)
                    : Icon(
                        EvaIcons.heart,
                        color: theme.isPurple()
                            ? MyTheme.lightPurple
                            : MyTheme.offWhite,
                        size: 30,
                      ),
              )),
        ],
      ),
    );
  }
}
