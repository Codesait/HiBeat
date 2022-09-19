import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hi_beat/src/res.dart';
import 'package:hi_beat/src/utils.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.context,
    required this.title,
  });

  final BuildContext context;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leading will hold our app logo
      leading: SizedBox(
        height: fullHeight(context) * 0.3,
        width: fullWidth(context) * 0.3,
        child: Image.asset(AppAssets.logo),
      ),

      // title will be updated according to the page the appbar is rendered
      title: Text(title),

      centerTitle: true,

      titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,

      actions: [
        SizedBox.square(
          dimension: 20,
          child: SvgPicture.asset(
            AppAssets.settingIcon,
            color: Theme.of(context).appBarTheme.iconTheme!.color,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size(fullWidth(context), 50);
}
