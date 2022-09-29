import 'package:flutter/material.dart';
import 'package:hi_beat/src/utils.dart';

class MyLibraryTab extends StatelessWidget {
  const MyLibraryTab(
      {super.key, required this.tabController, required this.tabs});
  final TabController tabController;
  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 60,
      color: Colors.red,
      alignment: Alignment.center,
      width: fullWidth(context),
      child: TabBar(
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
      ),
    );
  }
}
