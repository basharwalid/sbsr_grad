import 'package:flutter/material.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';

class CustomTextFormField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  String? hintText;
  Icon? prefixIcon;
  Icon? suffixIcon;
  Function validator;
  TextInputType? inputType;

  CustomTextFormField(
      {required this.controller,
      required this.hintText,
      required this.prefixIcon,
      required this.validator,
      required this.inputType,
      this.suffixIcon
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      style: Theme.of(context).textTheme.displayMedium,
      keyboardType: inputType,
      validator:(value) => validator(value),
      decoration: InputDecoration(
        filled: true,
        fillColor: MyTheme.offWhite.withOpacity(0.2),
        prefixIcon: prefixIcon,
        prefixIconColor: MyTheme.offWhite,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.displayMedium!.copyWith(color: MyTheme.offWhite.withOpacity(.70)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(width: 2 , color: MyTheme.offWhite),
        ),
        suffixIcon: suffixIcon,
        enabledBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(width: 2 , color: MyTheme.offWhite),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(width: 2 , color: MyTheme.offWhite.withOpacity(0.20)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(width: 2 , color: MyTheme.red),
        ),
        contentPadding: const EdgeInsets.all(8)
      ),
    );
  }
}
