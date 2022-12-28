
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
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: TabBar(
        isScrollable: true,
        padding: EdgeInsets.zero,
        indicatorPadding: EdgeInsets.zero,
        controller: tabController,
        labelColor: theme.textTheme.subtitle1!.color,
        unselectedLabelColor: theme.textTheme.subtitle1!.color,
        labelStyle: theme.textTheme.subtitle1,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: theme.primaryColor,
        ),
        tabs: tabs
            .map(
              (tab) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                width: fullWidth(context) / 4.5,
                decoration: BoxDecoration(
                  color: theme.primaryColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Tab(
                  text: tab,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
