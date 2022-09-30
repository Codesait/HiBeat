import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hi_beat/screens/myLibrary/viewmodel/library_viewmodel.dart';
import 'package:hi_beat/src/components.dart';
import 'package:hi_beat/src/screens.dart';
import 'package:hi_beat/src/utils.dart';

class MyLibraryView extends ConsumerStatefulWidget {
  const MyLibraryView({super.key});

  @override
  MyLibraryViewState createState() => MyLibraryViewState();
}

class MyLibraryViewState extends ConsumerState<MyLibraryView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // // viewmodel provider
    // final prd = ref.watch(myLibraryViewmodel);

    //initializing tab controller with tab length
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(myLibraryViewmodel);
    return DefaultTabController(
      length: provider.tabs.length,
      child: ViewsParentContainer(
        child: ListView(
          padding: const EdgeInsets.only(top: 100),
          physics: const NeverScrollableScrollPhysics(),
          children: [
            MyLibraryTab(
              tabController: tabController,
              tabs: provider.tabs,
            ),
            SizedBox(
              height: getContainerHeight(context),
              child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: const [
                    MySongs(),
                    MySongs(),
                    MySongs(),
                    MySongs(),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
