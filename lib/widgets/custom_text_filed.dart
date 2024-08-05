import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../style/app_colors.dart';

class CustomTextFiled extends StatelessWidget {
  String hintText;
  String? Function(String?)? validator;
  TextEditingController? controller;
  bool obscureText = false;
  TextInputType keyboardType = TextInputType.text;
  Widget? suffixIcon;
  var hintStyle;

  CustomTextFiled(
      {required this.hintText,
      required this.validator,
      required this.controller,
      required this.obscureText,
      this.keyboardType = TextInputType.text,
      required this.suffixIcon,
      this.hintStyle,
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: hintStyle,
          fillColor: AppColors.whiteColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 2,
              color: AppColors.blackColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 2,
              color: AppColors.primeryColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 2,
              color: AppColors.blackColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 2,
              color: AppColors.redColor,
            ),
          ),
          filled: true),
    );
  }
}
