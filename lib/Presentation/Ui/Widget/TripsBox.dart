import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';

class TripsBox extends StatelessWidget {
   VoidCallback callBackFunction;
  TripsBox({required this.callBackFunction,super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callBackFunction,
      child: Container(
        padding: EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: MyTheme.lightPurple,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.location_on_outlined, size: 30, color: Colors.white,),
                SizedBox(width: 10,),
                Text("Station 3 : Obour City Third Distract", style: Theme.of(context).textTheme.displayMedium,)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(LineAwesome.flag_solid, size: 30, color: Colors.white,),
                SizedBox(width: 10,),
                Text("Station 11 : Fifth Settlement Elnarges", style: Theme.of(context).textTheme.displayMedium,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
