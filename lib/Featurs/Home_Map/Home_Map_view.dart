// import 'dart:async';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/home_view_widgets/home_search_bar.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/home_view_widgets/home_tab_bar.dart';
import 'package:deyarakapp/Featurs/Home_Map/widgets/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(vsync: this, length: 4);
    return Scaffold(
      // backgroundColor: Colors.white,
//--------------------------------------------------
      // bottomNavigationBar: const BottomNavBar(),
//--------------------------------------------------
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const HomeSearchBar(),
          HomeTabBar(tabController: tabController),
          // IconRow(),
          const Map_w(),
        ],
      ),
    );
  }
}
