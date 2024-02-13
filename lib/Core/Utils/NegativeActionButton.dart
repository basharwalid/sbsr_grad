import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sbsr_grad/Core/Providers/ThemeProvider.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';

class NegativeActionButton extends StatelessWidget {
  VoidCallback? negativeAction;
  String negativeActionTitle;
  NegativeActionButton({required this.negativeActionTitle , this.negativeAction , super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    return Expanded(
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(theme.isPurple()?MyTheme.purple : MyTheme.offWhite),
              shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side:const BorderSide(width: 2, color: MyTheme.lightPurple),
                  )
              )
          ),
          onPressed: (){
            Navigator.pop(context);
            if (negativeAction != null){
              negativeAction!();
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FittedBox(
              child: Text(negativeActionTitle,style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: theme.isPurple()?MyTheme.offWhite : MyTheme.lightPurple,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
          ),
        )
    );
  }
}
