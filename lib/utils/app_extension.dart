import 'package:flutter/material.dart';
import 'package:pokemon/utils/theme/theme.dart';
import 'theme/colors_theme_extension.dart';

extension AppExtension on BuildContext {
  ThemeData get themeData => Theme.of(this);
  Color get primaryColor => appTheme.primaryColor;
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorThemeExt get colors => customTheme<ColorThemeExt>();
  T customTheme<T>() => Theme.of(this).extension<T>()!;
  double deviceHeight() => MediaQuery.of(this).size.height;
  double deviceWidth() => MediaQuery.of(this).size.width;
}
