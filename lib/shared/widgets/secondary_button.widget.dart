import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SecondaryButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget? child;
  final String? text;
  final String? appIcon;
  final double? width;
  final bool dense;
  final bool iconToRight;
  final bool isDisabled;
  final bool isLoading;
  final double? horizontalPadding;
  final Size? iconSize;

  const SecondaryButton({
    super.key,
    required this.onPressed,
    this.child,
    this.dense = false,
    this.width,
    this.text,
    this.appIcon,
    this.isDisabled = false,
    this.iconToRight = false,
    this.isLoading = false,
    this.horizontalPadding,
    this.iconSize,
  }) : assert(text != null || child != null);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: _getOnPressed(),
      style: _getButtonStyle(context),
      child: _getButtonContent(context),
    );
  }

  ButtonStyle _getButtonStyle(context) {
    var btnStyle = ButtonStyle(
      fixedSize: width == null
          ? null
          : MaterialStateProperty.all<Size>(
              Size.fromWidth(width!),
            ),
      padding: MaterialStateProperty.all<EdgeInsets>(
        EdgeInsets.only(
          top: dense ? 10 : 20,
          bottom: dense ? 10 : 20,
          left: horizontalPadding ??
              ((appIcon != null && !iconToRight)
                  ? (dense ? 12 : 22)
                  : (dense ? 16 : 24)),
          right: horizontalPadding ??
              ((appIcon != null && iconToRight)
                  ? (dense ? 12 : 22)
                  : (dense ? 16 : 24)),
        ),
      ),
    );

    if (isDisabled) {
      btnStyle = btnStyle.copyWith(
        // foregroundColor: MaterialStateProperty.all<Color>(Colors.grey),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade100),
        side: MaterialStateProperty.all<BorderSide>(
            BorderSide(color: Colors.grey.shade100)),
        overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
      );
    }

    return btnStyle.merge(OutlinedButtonTheme.of(context).style);
  }

  Widget? _getButtonContent(context) {
    if (isLoading) {
      return SizedBox(
        width: dense ? 14 : 16,
        height: dense ? 14 : 16,
        child: const CircularProgressIndicator(
          color: Colors.black45,
        ),
      );
    }

    if (text != null) {
      var textWidget = Text(
        text!,
      );

      if (appIcon != null) {
        var svg = SvgPicture.asset(
          appIcon!,
          width: iconSize?.width ?? (dense ? 16 : 18),
          colorFilter: isDisabled
              ? const ColorFilter.mode(Colors.grey, BlendMode.srcIn)
              : null,
        );
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconToRight ? textWidget : svg,
            SizedBox(width: dense ? 6 : 10),
            iconToRight ? svg : textWidget,
          ],
        );
      }

      return textWidget;
    }

    return child ?? const SizedBox.shrink();
  }

  Function()? _getOnPressed() {
    if (isDisabled) {
      return null;
    }
    if (isLoading) {
      return () {};
    }
    return onPressed;
  }
}
