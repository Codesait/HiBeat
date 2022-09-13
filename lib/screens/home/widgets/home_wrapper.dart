import 'package:flutter/material.dart';
import 'package:hi_beat/src/res.dart';
import 'package:hi_beat/src/screens.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'cutom_bottomnav_widget.dart';

class HomeWrapper extends StatefulWidget {
  const HomeWrapper({super.key});

  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {

  final _controller = PersistentTabController();

  final List<Widget> _bottomNavScreens = [
    const ExploreView(),
    const FavouriteView(),
  ];
   
  @override
  Widget build(BuildContext context) {
    

    return Stack(
      children: [

        //* custom bottom navigation wrapper
        PersistentTabView.custom(
          context,
          controller: _controller,
          screens: _bottomNavScreens,
          itemCount: 5,
          hideNavigationBar: false,
          backgroundColor: AppColors.black,
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
          ),

          //
          customWidget: CustomNavBarWidget(
            onItemSelected: (index) {
              setState(() {
                _controller.index = index;
              });
            },
            selectedIndex: _controller.index,
          ),
        ),


        //* mini player
        // Positioned(
        //   bottom: Platform.isAndroid ? 56 : 88,
        //   child: const MiniControlCenter(),
        // )
      ],
    );
  }
}