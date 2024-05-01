// import 'dart:async';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/home_view_widgets/home_search_bar.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/home_view_widgets/home_tab_bar.dart';
import 'package:deyarakapp/Featurs/Home_Map/presentation/manger/cubit/mapcubit_cubit.dart';
import 'package:deyarakapp/Featurs/Home_Map/presentation/views/widgets/map.dart';
import 'package:deyarakapp/core/widgets/custom_error_widget.dart';
import 'package:deyarakapp/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

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
          BlocBuilder<MapCubit, MapState>(builder: (context, state) {
            if (state is MapcubitSuccess) {
              return Map_w(
                mapmodelobj: state.map,
              );
            } else if (state is MapcubitFailure) {
              return CustomErrorWidget(errMsg: state.errMsg);
            } else {
              return Center(
                child: CustomLoadingIndicator(),
              );
            }
          }),
        ],
      ),
    );
  }
}
