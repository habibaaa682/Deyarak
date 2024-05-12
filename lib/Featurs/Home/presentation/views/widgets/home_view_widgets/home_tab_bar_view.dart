import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/home_view_widgets/apartment_list_view.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/home_view_widgets/family_house_list.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/home_view_widgets/furnitured_list.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/home_view_widgets/home_list_view.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/home_view_widgets/property_item.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/home_view_widgets/villa_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/service_locator.dart';
import '../../../../data/repos/home repo/home_repo_implementation.dart';
import '../../../manager/home_properties_cubit/home_properties_cubit.dart';

class HomeTabBarView extends StatefulWidget {
  final TabController tabController;
  const HomeTabBarView({super.key, required this.tabController, required this.searchText, required this.onSearch});
 final String searchText;
  final Function(String)onSearch;
  @override
  State<HomeTabBarView> createState() => _HomeTabBarViewState();
}

class _HomeTabBarViewState extends State<HomeTabBarView>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late HomePropertiesCubit homePropertiesCubit;

  final HomePropertiesCubit _homePropertiesCubit =
      HomePropertiesCubit(getIt.get<HomeRepoImpl>());

  @override
  void initState() {
    super.initState();
    print(widget.searchText);
    widget.tabController.addListener(_onTabChanged);
    homePropertiesCubit= context.read<HomePropertiesCubit>();
    homePropertiesCubit.fetchHomeProperties(fields:'?address=${widget.searchText}');

  }

  @override
  void dispose() {
    widget.tabController.removeListener(_onTabChanged);
    super.dispose();
  }

  void _onTabChanged() {
    final index = widget.tabController.index;
    switch (index) {
      case 0:
        homePropertiesCubit.fetchHomeProperties(fields:'?address=${widget.searchText}');

        break;
      case 1:
        _homePropertiesCubit.fetchHomeProperties(
            fields: '?category=apartment');
        break;
      case 2:
        _homePropertiesCubit.fetchHomeProperties(fields: '?category=villa');
        break;
      case 3:
        _homePropertiesCubit.fetchHomeProperties(fields: '?category=villa');
        break;
      case 4:
        _homePropertiesCubit.fetchHomeProperties(fields: '?category=villa');
        break;
      default:
        _homePropertiesCubit.fetchHomeProperties();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {

    super.build(context);
    return Expanded(
      child: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: TabBarView(
          controller: widget.tabController,
          children:  [
            HomePropertiesListView(searchText: widget.searchText,),
            ApartmentPropertiesListView(),
            HomeFamilyListView(),
            FurnituredListView(),
            VillaListView(),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
