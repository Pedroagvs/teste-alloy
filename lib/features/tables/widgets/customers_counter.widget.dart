import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teste_flutter/utils/constants/app_icons.constants.dart';
import 'package:teste_flutter/utils/extension_methos/material_extensions_methods.dart';

class CustomersCounter extends StatelessWidget {
  const CustomersCounter({
    super.key,
    required this.label,
    this.iconWidth,
    this.color,
    this.textStyle,
  });

  final String label;
  final double? iconWidth;
  final Color? color;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppIcons.twoPerson,
          width: iconWidth,
          colorFilter: ColorFilter.mode(color ?? Colors.black, BlendMode.srcIn),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: textStyle ?? context.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
