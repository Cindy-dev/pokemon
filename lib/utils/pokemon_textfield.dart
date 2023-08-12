import 'package:flutter/material.dart';
import 'package:pokemon/utils/app_extension.dart';
import 'package:pokemon/utils/theme/theme.dart';

class PokemonTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  bool? obscureText;
  bool? isEmail;
  Widget? suffixIcon;
  final TextInputType? keyboardType;
  String? Function(String?)? validate;
  String? Function(String?)? onChanged;
  PokemonTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.suffixIcon,
      this.obscureText = false,
      this.isEmail = false,
      this.keyboardType,
      this.validate,
      this.onChanged,
      required this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: isEmail! ? AutovalidateMode.onUserInteraction : null,
      onChanged: onChanged,
      obscureText: obscureText!,
      style: AppTextStyles.bodyMedium,
      textCapitalization: TextCapitalization.sentences,
      keyboardType: keyboardType ?? TextInputType.text,
      validator: validate ??
          (value) {
            if (value == null || value.isEmpty) {
              return "Field cannot be empty";
            }
            return null;
          },
      controller: controller,
      cursorColor: context.primaryColor,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: labelText,
        labelStyle: AppTextStyles.headingSemiBold.copyWith(
          fontSize: 14,
          height: 0.6,
          color: appTheme.shadowColor.withOpacity(0.5),
        ),
        hintText: hintText,
        hintStyle: AppTextStyles.bodyMedium.copyWith(fontSize: 14),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: context.themeData.colorScheme.error),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: context.themeData.primaryColorLight),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: context.themeData.primaryColorLight),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: context.themeData.primaryColorLight),
        ),
      ),
    );
  }
}
