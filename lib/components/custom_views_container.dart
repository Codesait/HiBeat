import 'package:flutter/material.dart';

class ViewsParentContainer extends StatelessWidget {
  const ViewsParentContainer(
      {super.key,
      required this.child,
      this.padding,
      this.alignment,
      this.width,
      this.height});

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(color: Theme.of(context).cardColor),
        padding: padding,
        alignment: alignment,
        height: height,
        width: width,
        child: child,
      ),
    );
  }
}
