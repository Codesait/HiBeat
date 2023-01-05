import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hi_beat/src/utils.dart';

class BackButton extends StatelessWidget {
  const BackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   IconButton(
      onPressed: ()=> Nav.pop(),
      icon:  Icon( Platform.isAndroid ? Icons.arrow_back: Icons.arrow_back_ios),
      color: Colors.white,
    );
  }
}
