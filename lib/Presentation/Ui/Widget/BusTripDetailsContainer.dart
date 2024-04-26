import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:sbsr_grad/Core/Providers/ThemeProvider.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
import 'package:sbsr_grad/Domain/Models/Bus.dart';

class BusTripDetailsContainer extends StatefulWidget {
  Function callBackFunction;
  Bus bus;
  Function onFavoriteClick;

  // Function favoriteCallBack;
  BusTripDetailsContainer({
    required this.callBackFunction,
    super.key,
    required this.bus,
    required this.onFavoriteClick,

    // required this.favoriteCallBack}
  });

  @override
  State<BusTripDetailsContainer> createState() =>
      _BusTripDetailsContainerState();
}

class _BusTripDetailsContainerState extends State<BusTripDetailsContainer> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    return InkWell(
      onTap: () => widget.callBackFunction(widget.bus),
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
                      Theme
                          .of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                        color: theme.isPurple()
                            ? MyTheme.offWhite
                            : MyTheme.darkPurple,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.bus.from,
                      style:
                      Theme
                          .of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
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
                      Theme
                          .of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                        color: theme.isPurple()
                            ? MyTheme.offWhite
                            : MyTheme.darkPurple,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.bus.to,
                      style:
                      Theme
                          .of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
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
                  widget.onFavoriteClick(widget.bus);
                },
                child: widget.bus.isFavorite
                    ? Icon(EvaIcons.heart,
                    size: 30,
                    color: theme.isPurple()
                        ? MyTheme.lightPurple
                        : MyTheme.offWhite)
                    : Icon(
                  LineAwesome.heart,
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
