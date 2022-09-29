import 'package:flutter/material.dart';
import 'package:hi_beat/src/components.dart';
import 'package:hi_beat/src/screens.dart';

class MyLibraryView extends StatefulWidget {
  const MyLibraryView({super.key});

  @override
  State<MyLibraryView> createState() => _MyLibraryViewState();
}

class _MyLibraryViewState extends State<MyLibraryView> with SingleTickerProviderStateMixin {

  late TabController  tabController;


  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  ViewsParentContainer(
      alignment: Alignment.center,
      child:  DefaultTabController(
        length: 4,
        child: Column(
          children: [
            MyLibraryTab(
              tabController: tabController,
            ),
            const Text(
              'My lib',
              style: TextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
