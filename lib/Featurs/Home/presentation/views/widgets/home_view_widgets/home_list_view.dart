import 'package:deyarakapp/Featurs/Home/presentation/manager/home_properties_cubit/home_properties_cubit.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/home_view_widgets/property_item.dart';
import 'package:deyarakapp/core/widgets/custom_error_widget.dart';
import 'package:deyarakapp/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePropertiesListView extends StatelessWidget {
  const HomePropertiesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePropertiesCubit, HomePropertiesState>(
      builder: (context, state) {
        if (state is AllHomePropertiesSuccess) {
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
        else if (state is HomePropertiesFailure) {
          return CustomErrorWidget(errMsg: state.errMsg);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
