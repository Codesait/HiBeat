import 'package:flutter/material.dart';
import 'package:hi_beat/src/components.dart';
import 'package:hi_beat/src/res.dart';

class MyPlayLists extends StatelessWidget {
  const MyPlayLists({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewsParentContainer(
      padding: const EdgeInsets.only(
        bottom: 190,
      ),
      child: ListView(
        children: const [
          // create playlist button
          CreatePlaylist(),

          // divider seperating create widget and list
          Divider(
            thickness: 0.4,
            indent: 20,
            endIndent: 20,
          ),
        ],
      ),
    );
  }
}

class CreatePlaylist extends StatelessWidget {
  const CreatePlaylist({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      onTap: () {},
      minVerticalPadding: 30,
      title: Text(
        'New Playlist',
        style: theme.textTheme.titleSmall,
      ),
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: const Center(
          child: Icon(
            Icons.add,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
