import 'package:flutter/material.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';

class UserDetailsProfileContainer extends StatelessWidget {
  String title;
  IconData preIcon;
  UserDetailsProfileContainer({required this.title,required this.preIcon, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: MyTheme.offWhite),
        borderRadius: BorderRadius.circular(25),
        color: MyTheme.offWhite.withOpacity(0.2),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(preIcon, size: 25, color: MyTheme.offWhite,),
            const SizedBox(
              width: 14,
            ),
            Text(title, style: Theme.of(context).textTheme.displayMedium,),
          ],
        ),
      ),
    );
  }
}
