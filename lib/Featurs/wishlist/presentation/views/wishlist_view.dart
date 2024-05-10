import 'package:deyarakapp/Featurs/wishlist/data/repos/wishlist%20repo/wishlist_repo_impl.dart';
import 'package:deyarakapp/Featurs/wishlist/presentation/manager/wishlist%20cubit/wishlist_cubit.dart';
import 'package:deyarakapp/Featurs/wishlist/presentation/views/widgets/wishlist_body.dart';
import 'package:deyarakapp/constants.dart';
import 'package:deyarakapp/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../controllers/sharedPrefrenceController.dart';

class WishlistView extends StatefulWidget {
  const WishlistView({super.key});

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishlistCubit(getIt.get<WishlistRepoImpl>()),
      child: const Scaffold(body: WishlistBody()),
    );
  }
}
