import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';

class CustomPasswordTextFormField extends StatefulWidget {
  TextEditingController controller = TextEditingController();
  String? hintText;
  Icon? prefixIcon;
  Icon? suffixIcon;
  Function validator;
  TextInputType? inputType;

  CustomPasswordTextFormField(
      {required this.controller,
      required this.hintText,
      required this.prefixIcon,
      required this.validator,
      required this.inputType,
      this.suffixIcon});

  @override
  State<CustomPasswordTextFormField> createState() =>
      _CustomPasswordTextFormFieldState();
}

class _CustomPasswordTextFormFieldState
    extends State<CustomPasswordTextFormField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !isVisible,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      style: Theme.of(context).textTheme.displayMedium,
      keyboardType: widget.inputType,
      validator: (value) => widget.validator(value),
      decoration: InputDecoration(
          filled: true,
          fillColor: MyTheme.offWhite.withOpacity(0.2),
          prefixIcon: widget.prefixIcon,
          prefixIconColor: MyTheme.offWhite,
          hintText: widget.hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: MyTheme.offWhite.withOpacity(.70)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(width: 2, color: MyTheme.offWhite),
          ),
          suffixIcon: InkWell(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            onTap: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
            child: isVisible
                ? const Icon(
                    AntDesign.eye_fill,
                    color: MyTheme.offWhite,
                  )
                : const Icon(
                    AntDesign.eye_invisible_outline,
                    color: MyTheme.offWhite,
                  ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(width: 2, color: MyTheme.offWhite),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
                BorderSide(width: 2, color: MyTheme.offWhite.withOpacity(0.20)),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(width: 2, color: MyTheme.red),
          ),
          contentPadding: const EdgeInsets.all(8)),
    );
  }
}
