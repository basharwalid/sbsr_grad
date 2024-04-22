import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
import 'package:sbsr_grad/Domain/Models/Bus.dart';

class FavoriteBusContainer extends StatefulWidget {
  Function callBackFunction;
  Bus hiveBusModel;

  Function favoriteCallBack;

  FavoriteBusContainer({
    required this.callBackFunction,
    super.key,
    required this.hiveBusModel,
    required this.favoriteCallBack}
  );

  @override
  State<FavoriteBusContainer> createState() => _FavoriteBusContainerState();
}

class _FavoriteBusContainerState extends State<FavoriteBusContainer> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
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
                      widget.hiveBusModel.from,
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
                      widget.hiveBusModel.to,
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
                    widget.favoriteCallBack(widget.hiveBusModel);
                  },
                child: widget.hiveBusModel.isFavorite
                    ?  const Icon(
                        LineAwesome.heart,
                        color: MyTheme.lightPurple,
                        size: 30,
                      ): const Icon(
                  EvaIcons.heart,
                  size: 30,
                  color: MyTheme.lightPurple,
                )

              )),
        ],
      ),
    );
  }
}
