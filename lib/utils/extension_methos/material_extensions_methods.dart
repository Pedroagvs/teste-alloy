import 'package:flutter/material.dart';

import '../../themes/app_colors.theme_extension.dart';

extension TextStyleExtension on TextStyle? {
  TextStyle? boldWeight() => this?.copyWith(fontWeight: FontWeight.bold);
  TextStyle? mediumWeight() => this?.copyWith(fontWeight: FontWeight.w500);
  TextStyle? withUnderline() =>
      this?.copyWith(decoration: TextDecoration.underline);

  TextStyle? withPrimaryColor(BuildContext context) => this?.copyWith(
        color: context.appColors.green,
      );
  TextStyle? withErrorColor(BuildContext context) => this?.copyWith(
        color: context.appColors.alertRed,
      );

  TextStyle? withDefaultColor(BuildContext context) => this?.copyWith(
        color: Colors.black,
      );

  TextStyle? withBlack54() => this?.copyWith(
        color: Colors.black54,
      );
}

extension ContextExtension on BuildContext {
  Size get sizeOf => MediaQuery.sizeOf(this);
  EdgeInsets get padding => MediaQuery.viewPaddingOf(this);
  AppColors get appColors => Theme.of(this).extension<AppColors>()!;
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
