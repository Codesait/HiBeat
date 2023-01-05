import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hi_beat/src/components.dart';
import 'package:hi_beat/src/res.dart';
import 'package:hi_beat/utils/mediaquery.dart';

class ViewsParentContainer extends StatelessWidget {
  const ViewsParentContainer({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.only(top: 40, bottom: 60),
    this.margin,
    this.alignment,
    this.width,
    this.height,
    this.notFound = false,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;
  final double? height, width;
  final bool notFound;

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
        child: notFound ? const NotFound() : child,
      ),
    );
  }
}

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            AppAssets.notFoundIllustration,
            height: 200,
            width: 200,
          ),
          const Gap(dimension: 10),
          const Text('Nothing here')
        ],
      ),
    );
  }
}
