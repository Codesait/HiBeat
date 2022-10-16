import 'package:flutter/material.dart';

class ViewsParentContainer extends StatelessWidget {
  const ViewsParentContainer({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.alignment,
    this.width,
    this.height,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(color: Theme.of(context).cardColor),
        padding: padding,
        margin: margin,
        alignment: alignment,
        height: height,
        width: width,
        child: child,
      ),
    );
  }
}
