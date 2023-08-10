library theme;

import 'package:flutter/material.dart';
import 'colors_theme_extension.dart';
part 'app_colors.dart';
part 'app_fonts.dart';
part 'text_styles.dart';

final ThemeData appTheme = _buildLightTheme();

ThemeData _buildLightTheme() {
  const Color primaryColor = _Colors.black;
  const Color primaryColorLight = _Colors.blackLight;
  const Color secondaryColor = _Colors.white;

  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
    error: _Colors.red,
  );
  final themeData = ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    primaryColor: primaryColor,
    primaryColorLight: primaryColorLight,
    scaffoldBackgroundColor: _Colors.white,
    hintColor: _Colors.black,
    highlightColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: _Colors.white,
      centerTitle: true,
      elevation: 0,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: _Colors.white,
      shape: CircularNotchedRectangle(),
    ),
    snackBarTheme: SnackBarThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      behavior: SnackBarBehavior.fixed,
      contentTextStyle: AppTextStyles.headingSemiBold,
      insetPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
    ),
    dividerColor: _Colors.black,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.maxFinite, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
        backgroundColor: primaryColor,
        textStyle: AppTextStyles.heading2Bold
            .copyWith(color: _Colors.white, fontSize: 15),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 13.5),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: primaryColor),
        ),
        elevation: 0,
        textStyle: AppTextStyles.heading2Bold.copyWith(color: _Colors.black),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 13.5),
      ),
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: _Colors.white,
      contentTextStyle: AppTextStyles.headingSemiBold,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: AppTextStyles.heading2Bold.copyWith(color: _Colors.white),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(3),
        borderSide: BorderSide(color: _Colors.blackLight.withOpacity(0.5)),
      ),
      isDense: true,
      hintStyle: AppTextStyles.bodyMedium
          .copyWith(color: _Colors.blackLight.withOpacity(0.7)),
    ),
    textTheme: const TextTheme(
      displayLarge: AppTextStyles.headingBold,
      titleLarge: AppTextStyles.headingSemiBold,
      headlineLarge: AppTextStyles.headingBold,
      headlineMedium: AppTextStyles.heading2Bold,
      titleMedium: AppTextStyles.bodySemiBold,
      bodyMedium: AppTextStyles.bodyMedium,
      bodyLarge: AppTextStyles.bodySemiBold,
      bodySmall: AppTextStyles.bodyMedium,
    ),
    extensions: [
      ColorThemeExt(
        black: _Colors.black,
        green: _Colors.green,
        yellow: _Colors.yellow,
        red: _Colors.red,
        white: _Colors.white,
        blackLight: _Colors.blackLight,
        blue: _Colors.blue,
      ),
    ],
  );
  return themeData;
}
