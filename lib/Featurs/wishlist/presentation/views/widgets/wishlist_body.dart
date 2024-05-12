import 'package:deyarakapp/Featurs/wishlist/presentation/manager/wishlist%20cubit/wishlist_cubit.dart';
import 'package:deyarakapp/controllers/sharedPrefrenceController.dart';
import 'package:deyarakapp/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../Home/presentation/views/widgets/home_view_widgets/property_item.dart';

class WishlistBody extends StatefulWidget {
  const WishlistBody({super.key});

  @override
  State<WishlistBody> createState() => _WishlistBodyState();
}

class _WishlistBodyState extends State<WishlistBody> {
  late WishlistCubit wishlistCubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wishlistCubit = context.read<WishlistCubit>();
    wishlistCubit.getWishlist(
        userId: GlobalSharedPreferences.getString('userId'));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistCubit, WishlistState>(
      builder: (context, state) {
        if (state is WishlistSuccess) {
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 26, vertical: 16),
                child: SafeArea(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Wishlist',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior().copyWith(overscroll: false),
                  child: ListView.builder(
                    itemCount: state.wishlist.length,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 16),
                    itemBuilder: (context, index) {
                      return PropertyItem(
                        homeModelobject: state.wishlist[index],
                      );
                    },
                  ),
                ),
              )
            ],
          );
        } else if (state is WishlistFailure) {
          return CustomErrorWidget(errMsg: state.errMsg);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
