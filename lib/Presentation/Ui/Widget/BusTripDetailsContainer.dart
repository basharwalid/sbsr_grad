import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
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
              color: MyTheme.lightPurple,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "From:",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.bus.from,
                      style: Theme.of(context).textTheme.displayMedium,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Icon(
                      LineAwesome.flag_solid,
                      size: 30,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "To: ",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.bus.to,
                      style: Theme.of(context).textTheme.displayMedium,
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                ),
                color: MyTheme.white,
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
                    ? const Icon(
                        EvaIcons.heart,
                        size: 30,
                        color: MyTheme.lightPurple,
                      )
                    : const Icon(
                        LineAwesome.heart,
                        color: MyTheme.lightPurple,
                        size: 30,
                      ),
              )),
        ],
      ),
    );
  }
}
