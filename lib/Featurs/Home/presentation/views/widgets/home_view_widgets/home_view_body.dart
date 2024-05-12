import 'package:deyarakapp/Featurs/Home/presentation/manager/home_properties_cubit/home_properties_cubit.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/home_view_widgets/Add_floating_action_button.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/home_view_widgets/home_search_bar.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/home_view_widgets/home_tab_bar_view.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/home_view_widgets/home_tab_bar.dart';
import 'package:deyarakapp/controllers/sharedPrefrenceController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody>
    with TickerProviderStateMixin {
  late String searchText;
  late HomePropertiesCubit homePropertiesCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homePropertiesCubit= context.read<HomePropertiesCubit>();

    homePropertiesCubit.fetchHomeProperties();
    searchText='';
  }
  @override
  Widget build(BuildContext context) {

    void handleSearch(String text){
      setState(() {
        searchText= text;
      });

    }



    TabController tabController = TabController(vsync: this, length: 5);
    return Scaffold(
      floatingActionButton: const AddFloatingActionButton(),
      body: Column(children: [
        SafeArea(child:  HomeSearchBar(onSearch: handleSearch,)),
        HomeTabBar(tabController: tabController),
        HomeTabBarView(
          onSearch: handleSearch,
          searchText: searchText,
          tabController: tabController,
        ),
      ]),
    );
  }
}
