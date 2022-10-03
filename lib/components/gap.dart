import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Gap extends StatelessWidget {
  const Gap({super.key, required this.dimension});
  final double dimension;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(dimension: dimension,);
  }
}