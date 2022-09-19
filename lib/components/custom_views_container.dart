import 'package:flutter/material.dart';

class ViewsParentContainer extends StatelessWidget {
  const ViewsParentContainer({
    super.key,
    required this.child,
    this.padding,
    this.alignment,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).cardColor),
      padding: padding,
      alignment: alignment,
      child: child,
    );
  }
}
