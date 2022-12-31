import 'package:flutter/material.dart';
import 'package:hi_beat/src/components.dart';
import 'package:hi_beat/src/res.dart';
import 'package:hi_beat/src/screens.dart';
import 'package:hi_beat/src/utils.dart';
import 'package:mini_player/expandable_player.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'custom_bottom_nav_widget.dart';

class HomeWrapper extends StatefulWidget {
  const HomeWrapper({super.key});

  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper>
    with SingleTickerProviderStateMixin {
  final navController = PersistentTabController();

  late AnimationController controller;

  // views
  final List<Widget> _bottomNavScreens = [
    const ExploreView(),
    const FavoriteView(),
    const MyLibraryView(),
    const GenreView(),
    const ProfileView()
  ];

  @override
  void initState() {
    Functions.revealToolBar();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final hideNav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          //*
          //* custom bottom navigation wrapper
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: fullHeight(context),
            child: PersistentTabView.custom(
              context,
              controller: navController,
              screens: _bottomNavScreens,
              itemCount: 5,
              hideNavigationBar: false,
              resizeToAvoidBottomInset: true,
              backgroundColor: Theme.of(context).backgroundColor,
              screenTransitionAnimation: const ScreenTransitionAnimation(
                animateTabTransition: true,
                curve: Curves.bounceIn,
              ),
              //* custom navigation widget
              customWidget: hideNav
                  ? const SizedBox()
                  : CustomNavBarWidget(
                      onItemSelected: (index) {
                        setState(() {
                          navController.index = index;
                        });
                      },
                      selectedIndex: navController.index,
                    ),
            ),
          ),

          //* appbar position
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomAppBar(
              context: context,
              title: _getAppBarTitle(),
            ),
          ),

          //* mini player
          ExpandablePlayer(
            context: context,
            animationController: controller,
            enableBottomPadding: true,
          )
        ],
      ),
    );
  }

  String _getAppBarTitle() {
    switch (navController.index) {
      case 0:
        return explore;
      case 1:
        return favorite;
      case 2:
        return library;

      case 3:
        return genre;

      case 4:
        return profile;

      default:
        return explore;
    }
  }
}
