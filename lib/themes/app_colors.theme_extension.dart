import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color? green;
  final Color? lightGreen;
  final Color? red;
  final Color? lightRed;
  final Color? alertRed;
  final Color? orange;
  final Color? lightOrange;
  final Color? blue;
  final Color? lightBlue;
  final Color? lightGrey;
  final Color? grey;
  final Color? alertYellow;
  final Color? darkGrey;
  final Color? offWhite;

  const AppColors({
    required this.green,
    required this.lightGreen,
    required this.red,
    required this.lightRed,
    required this.alertRed,
    required this.orange,
    required this.lightOrange,
    required this.blue,
    required this.lightBlue,
    required this.lightGrey,
    required this.grey,
    required this.alertYellow,
    required this.darkGrey,
    required this.offWhite,
  });

  @override
  ThemeExtension<AppColors> copyWith({
    Color? green,
    Color? lightGreen,
    Color? red,
    Color? lightRed,
    Color? alertRed,
    Color? orange,
    Color? lightOrange,
    Color? blue,
    Color? lightBlue,
    Color? lightGrey,
    Color? grey,
    Color? alertYellow,
    Color? darkGrey,
    Color? offWhite,
  }) {
    return AppColors(
      green: green ?? this.green,
      lightGreen: lightGreen ?? this.lightGreen,
      red: red ?? this.red,
      lightRed: lightRed ?? this.lightRed,
      alertRed: alertRed ?? this.alertRed,
      orange: orange ?? this.orange,
      lightOrange: lightOrange ?? this.lightOrange,
      blue: blue ?? this.blue,
      lightBlue: lightBlue ?? this.lightBlue,
      lightGrey: lightGrey ?? this.lightGrey,
      grey: grey ?? this.grey,
      alertYellow: alertYellow ?? this.alertYellow,
      darkGrey: darkGrey ?? this.darkGrey,
      offWhite: offWhite ?? this.offWhite,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(
      covariant ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }

    return AppColors(
      green: Color.lerp(green, other.green, t),
      lightGreen: Color.lerp(lightGreen, other.lightGreen, t),
      red: Color.lerp(red, other.red, t),
      lightRed: Color.lerp(lightRed, other.lightRed, t),
      alertRed: Color.lerp(alertRed, other.alertRed, t),
      orange: Color.lerp(orange, other.orange, t),
      lightOrange: Color.lerp(lightOrange, other.lightOrange, t),
      blue: Color.lerp(blue, other.blue, t),
      lightBlue: Color.lerp(lightBlue, other.lightBlue, t),
      lightGrey: Color.lerp(lightGrey, other.lightGrey, t),
      grey: Color.lerp(grey, other.grey, t),
      alertYellow: Color.lerp(grey, other.alertYellow, t),
      darkGrey: Color.lerp(darkGrey, other.darkGrey, t),
      offWhite: Color.lerp(offWhite, other.offWhite, t),
    );
  }
}
