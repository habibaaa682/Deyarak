
import 'package:deyarakapp/Featurs/Home/presentation/manager/family_house_cubit/family_house_cubit.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/home_view_widgets/property_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../../core/widgets/custom_loading_indicator.dart';

class HomeFamilyListView extends StatelessWidget {
  const HomeFamilyListView({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FamilyHouseCubit, FamilyHouseState>(
      builder: (context, state) {
        if (state is FamilyHouseSuccess) {
          return ListView.builder(
            itemCount: state.homeProperties.length,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            itemBuilder: (context, index) {
              return PropertyItem(
                homeModelobject: state.homeProperties[index],
              );
            },
          );
        }
        else if (state is FamilyHouseFailure) {
          return CustomErrorWidget(errMsg: state.errMsg);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }}