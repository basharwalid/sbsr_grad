import 'package:flutter/material.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';

class CustomFieldProfile extends StatelessWidget {
  String fieldData;
  //IconData prefixIcon;
  CustomFieldProfile({required this.fieldData,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: MyTheme.offWhite, width: 2),
      ),
      child: Row(
        children: [

          const SizedBox(width: 10,),
          Text(fieldData, style: Theme.of(context).textTheme.displayMedium,),
        ],
      ),
    );
  }
}
