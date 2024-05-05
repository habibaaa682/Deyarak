import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/home_view_widgets/apartment_list_view.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/home_view_widgets/home_list_view.dart';

import 'package:flutter/material.dart';

class HomeTabBarView extends StatefulWidget {
  final TabController tabController;
  const HomeTabBarView({super.key, required this.tabController});

  @override
  State<HomeTabBarView> createState() => _HomeTabBarViewState();
}

class _HomeTabBarViewState extends State<HomeTabBarView>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Expanded(
      child: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: TabBarView(
          controller: widget.tabController,
          children: const [
            HomePropertiesListView(),
            ApartmentPropertiesListView(),
            Text('home only'),
            Text('furnitured only'),
            Text('villas only'),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
