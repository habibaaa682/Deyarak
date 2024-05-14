import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/home_view_widgets/custom_search_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/router.dart';

class HomeSearchBar extends StatelessWidget {
  HomeSearchBar({super.key, required this.onSearch});
  final Function(String) onSearch;

  @override
  Widget build(BuildContext context) {
    onSearch;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: CustomSearchField(
              onSubmitted: onSearch,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Colors.grey,
                )),
            child: IconButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kFilter);
                },
                icon: const Icon(
                  FontAwesomeIcons.sliders,
                  size: 18,
                  color: Colors.black,
                )),
          )
        ],
      ),
    );
  }
}
