import 'package:flutter/material.dart';

import 'app_colors.theme_extension.dart';

const _green = Color(0xFF1FB76C);
const _lightGreen = Color(0x191FB76C);
const _red = Color(0xFFFF1445);
const _lightRed = Color(0x19FF1445);
const _alertRed = Color(0xFFB3261E);
const _orange = Color(0xFFFF8441);
const _lightOrange = Color(0x19FF8441);
const _blue = Color(0xFF276EF1);
const _lightBlue = Color(0x19276EF1);
const _grey = Color.fromRGBO(0, 0, 0, 0.1);
const _lightGrey = Color.fromRGBO(0, 0, 0, 0.06);
const _alertYellow = Color(0xFFffe15d);
const _darkGrey = Color(0xFF7f7f7f);
const _offWhite = Color.fromRGBO(249, 249, 245, 0.5);

final MaterialColor _primaryMaterialColor = MaterialColor(
  _green.value,
  const {
    50: Color(0xFFE0F2F1),
    100: Color(0xFFB2DFDB),
    200: Color(0xFF80CBC4),
    300: Color(0xFF4DB6AC),
    400: Color(0xFF26A69A),
    500: Color(0xFF009688),
    600: Color(0xFF00897B),
    700: Color(0xFF00796B),
    800: Color(0xFF00695C),
    900: Color(0xFF004D40),
  },
);

ThemeData lightTheme() {
  return ThemeData(
    chipTheme: const ChipThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(100),
        ),
      ),
      backgroundColor: _lightGreen,
      side: BorderSide.none,
      labelStyle: TextStyle(
        color: _green,
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
      labelPadding: EdgeInsets.all(0),
    ),
    sliderTheme: const SliderThemeData(
      showValueIndicator: ShowValueIndicator.onlyForContinuous,
      valueIndicatorTextStyle: TextStyle(
        color: Colors.white,
      ),
    ),
    switchTheme: SwitchThemeData(
      trackOutlineColor: const MaterialStatePropertyAll(_grey),
      thumbColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.white;
        }

        return Colors.black38;
      }),
      trackColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return _green;
        }

        return null;
      }),
    ),
    expansionTileTheme: ExpansionTileThemeData(
      backgroundColor: Colors.transparent,
      collapsedBackgroundColor: Colors.transparent,
      tilePadding: const EdgeInsets.symmetric(horizontal: 12),
      iconColor: Colors.black,
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: _grey),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: _grey),
      ),
      childrenPadding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
    ),
    tooltipTheme: const TooltipThemeData(
      preferBelow: false,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      waitDuration: Duration(milliseconds: 250),
    ),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      elevation: 0,
      splashColor: Colors.transparent,
      hoverElevation: 0,
      backgroundColor: _lightGreen,
      foregroundColor: _green,
      highlightElevation: 0,
    ),
    cardTheme: const CardTheme(
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 8,
    ),
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: _primaryMaterialColor,
      backgroundColor: Colors.white,
      accentColor: Colors.black.withOpacity(0.1),
      cardColor: Colors.white,
      errorColor: _alertRed,
    ),
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
    popupMenuTheme: const PopupMenuThemeData(
      surfaceTintColor: Colors.white,
    ),
    checkboxTheme: const CheckboxThemeData(
      checkColor: MaterialStatePropertyAll(Colors.white),
      side: BorderSide(
        color: Colors.black45,
        width: 2,
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        side: const MaterialStatePropertyAll(
          BorderSide(
            color: Colors.black12,
          ),
        ),
        foregroundColor: const MaterialStatePropertyAll<Color>(
          Colors.black,
        ),
      ),
    ),
    dividerTheme: DividerThemeData(
      color: Colors.black.withOpacity(0.1),
      space: 1,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        color: Color(0xFF49454F),
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black12,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black12,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: _green,
          width: 2,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: _alertRed,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: _alertRed,
        ),
      ),
      errorStyle: TextStyle(
        fontSize: 12,
        height: 0.8,
        color: _alertRed,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color>((states) =>
            states.contains(MaterialState.disabled)
                ? Colors.grey
                : Colors.white),
        padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(horizontal: 24, vertical: 20)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
          ),
        ),
        overlayColor: const MaterialStatePropertyAll<Color>(
          Colors.black12,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        side: const MaterialStatePropertyAll(
          BorderSide(
            color: Colors.black12,
          ),
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color>((states) =>
            states.contains(MaterialState.disabled)
                ? Colors.grey
                : Colors.black),
        padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(horizontal: 24, vertical: 20)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    ),
    dialogTheme: const DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 20,
        color: Colors.black,
        fontFamily: 'Roboto',
      ),
      contentTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      ),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: const InputDecorationTheme(
        hoverColor: Colors.blue,
        focusColor: Colors.red,
      ),
      menuStyle: MenuStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        surfaceTintColor: MaterialStateProperty.all(Colors.white),
        elevation: MaterialStateProperty.all(8),
      ),
    ),
    extensions: const [
      AppColors(
        green: _green,
        lightGreen: _lightGreen,
        red: _red,
        lightRed: _lightRed,
        alertRed: _alertRed,
        orange: _orange,
        lightOrange: _lightOrange,
        blue: _blue,
        lightBlue: _lightBlue,
        lightGrey: _lightGrey,
        grey: _grey,
        alertYellow: _alertYellow,
        darkGrey: _darkGrey,
        offWhite: _offWhite,
      ),
    ],
  );
}
