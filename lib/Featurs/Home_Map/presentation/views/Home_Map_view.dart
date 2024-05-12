// import 'dart:async';
import 'package:deyarakapp/Featurs/Home/data/repos/property%20details%20rebo/property_datails_repo_impl.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/home_view_widgets/home_search_bar.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/home_view_widgets/home_tab_bar.dart';
import 'package:deyarakapp/Featurs/Home_Map/presentation/manger/cubit/mapcubit_cubit.dart';
import 'package:deyarakapp/Featurs/Home_Map/presentation/views/widgets/map.dart';
import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/appbarwidget.dart';
import 'package:deyarakapp/core/utils/service_locator.dart';
import 'package:deyarakapp/core/widgets/custom_error_widget.dart';
import 'package:deyarakapp/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';



class MapView extends StatefulWidget {
  const MapView({Key? key,  this.lat=30.550968,  this.lng=31.008668});
final double lat;
final double lng;
  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> with TickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(vsync: this, length: 5);
    return Scaffold(

      // backgroundColor: Colors.white,
//--------------------------------------------------
      // bottomNavigationBar: const BottomNavBar(),
//--------------------------------------------------
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

     
   const Padding(
      padding: EdgeInsets.only(bottom: 16),
      child:  HomeSearchBar(),
    ),
            // IconRow(),
            BlocBuilder<MapCubit, MapState>(builder: (context, state) {
              if (state is MapcubitSuccess) {
                return Map_w(

                  mapmodelobj: state.map,
                 lat: widget.lat,
                  lng: widget.lng,
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
      ),
    );
  }
}
