import 'package:deyarakapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/router.dart';

class AddFloatingActionButton extends StatelessWidget {
  const AddFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: kprimarycolor,
      onPressed: () {},
      child: IconButton(
        onPressed: () {
          GoRouter.of(context).push(AppRouter.kAddProperty);
        },
        icon: const Icon(
          Icons.add,
        ),
        iconSize: 40,
      ),
    );
  }
}
