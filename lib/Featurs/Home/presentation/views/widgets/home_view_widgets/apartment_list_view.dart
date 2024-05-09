import 'package:deyarakapp/Featurs/Home/presentation/manager/apartment_cubit/apartment_cubit_cubit.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/home_view_widgets/property_item.dart';
import 'package:deyarakapp/core/widgets/custom_error_widget.dart';
import 'package:deyarakapp/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApartmentPropertiesListView extends StatelessWidget {
  const ApartmentPropertiesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApartmentCubitCubit, ApartmentCubitState>(
      builder: (context, state) {
        if (state is ApartmentCubitSuccess) {
          return ListView.builder(
            itemCount: state.homeProperties.length,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            itemBuilder: (context, index) {
              return PropertyItem(
                homeModelobject: state.homeProperties[index],
              );
            },
          );
        } else if (state is ApartmentCubitFailure) {
          return CustomErrorWidget(errMsg: state.errMsg);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
