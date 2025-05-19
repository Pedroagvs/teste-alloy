import 'package:flutter/material.dart';

class Modal extends StatelessWidget {
  final String? title;
  final Widget? titleWidget;
  final List<Widget> content;
  final EdgeInsetsGeometry? contentPadding;
  final CrossAxisAlignment contentCrossAxisAlignment;
  final List<Widget>? actions;
  final EdgeInsetsGeometry? actionsPadding;
  final EdgeInsetsGeometry? titlePadding;
  final double? width;
  final MainAxisSize contentMainAxisSize;
  final MainAxisAlignment actionsAlignment;

  const Modal({
    super.key,
    this.title,
    this.titleWidget,
    required this.content,
    this.contentPadding,
    this.actions,
    this.actionsPadding,
    this.contentCrossAxisAlignment = CrossAxisAlignment.center,
    this.contentMainAxisSize = MainAxisSize.min,
    this.titlePadding,
    this.width = 280,
    this.actionsAlignment = MainAxisAlignment.start,
  }) : assert(title != null || titleWidget != null);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        contentPadding: contentPadding,
        elevation: 6,
        shadowColor: Colors.black38,
        surfaceTintColor: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (titleWidget != null)
                ? titleWidget!
                : Text(title!,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.w400)),
            const CloseButton(
              style: ButtonStyle(
                side: MaterialStatePropertyAll(BorderSide.none),
              ),
            ),
          ],
        ),
        content: SizedBox(
          width: width,
          child: Column(
            mainAxisSize: contentMainAxisSize,
            crossAxisAlignment: contentCrossAxisAlignment,
            children: content,
          ),
        ),
        actionsAlignment: actionsAlignment,
        actions: actions,
        actionsPadding: actionsPadding,
      ),
    );
  }
}
