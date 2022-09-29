import 'package:flutter/material.dart';
import 'package:hi_beat/res/constants/app_strings.dart';

class MyLibraryTab extends StatelessWidget {
  const MyLibraryTab({
    super.key,
    required this.tabController,
  });
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    /// Creating a list of tab strings.
    final tabs = <String>[
      playlists,
      songs,
      albums,
      artists,
    ];

    return  TabBar(
        controller: tabController,
        unselectedLabelColor: theme.cardColor.withOpacity(0.5),
        indicatorSize: TabBarIndicatorSize.label,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: theme.primaryColor,
        ),
        tabs: tabs
            .map(
              (tab) => Tab(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: theme.primaryColor, width: 1)),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(tab),
                  ),
                ),
              ),
            )
            .toList(),
      
    );
  }
}
