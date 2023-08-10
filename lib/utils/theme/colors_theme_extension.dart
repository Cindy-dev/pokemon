import 'package:flutter/material.dart';

class ColorThemeExt extends ThemeExtension<ColorThemeExt> {
  final Color red;
  final Color white;
  final Color black;
  final Color blackLight;
  final Color green;
  final Color blue;
  final Color yellow;

  ColorThemeExt({
    required this.blackLight,
    required this.blue,
    required this.black,
    required this.green,
    required this.yellow,
    required this.red,
    required this.white,
  });
  @override
  ThemeExtension<ColorThemeExt> copyWith({
    Color? red,
    Color? white,
    Color? black,
    Color? green,
    Color? yellow,
    Color? blackLight,
    Color? blue,
  }) {
    return ColorThemeExt(
        black: black ?? this.black,
        green: green ?? this.green,
        yellow: yellow ?? this.yellow,
        red: red ?? this.red,
        white: white ?? this.white,
        blackLight: blackLight ?? this.blackLight,
        blue: blue ?? this.blue);
  }

  @override
  ThemeExtension<ColorThemeExt> lerp(
    covariant ThemeExtension<ColorThemeExt>? other,
    double t,
  ) {
    return this;
  }
}
