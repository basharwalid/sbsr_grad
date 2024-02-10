import 'package:flutter/material.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';

class SignInWith extends StatelessWidget {
  String text;
  String image;

  SignInWith({required this.text,required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: MyTheme.offWhite,
            width: 2,
            style: BorderStyle.solid,
          )),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, width: 30 , height: 30),
            const SizedBox(
              width: 10,
            ),
            const SizedBox(
              height: 30,
              child:
              VerticalDivider(
                  thickness: 2,
                  color: MyTheme.offWhite
              ),
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.displayLarge,
            )
          ],
        ),
      ),
    );
  }
}
