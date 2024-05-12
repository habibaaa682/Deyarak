import 'package:deyarakapp/Featurs/Home/data/Models/home_model/home_model.dart';
import 'package:deyarakapp/Featurs/Home/presentation/manager/related_suggestions_cubit/related_suggestions_cubit.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/home_view_widgets/property_item.dart';
import 'package:deyarakapp/core/widgets/custom_error_widget.dart';
import 'package:deyarakapp/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class RelatedSuggestion extends StatefulWidget {
  const RelatedSuggestion({super.key, required this.propertyId});
  final String propertyId;

  @override
  State<RelatedSuggestion> createState() => _RelatedSuggestionState();
}

class _RelatedSuggestionState extends State<RelatedSuggestion> {
  late RelatedSuggestionsCubit relatedSuggestionsCubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    relatedSuggestionsCubit = context.read<RelatedSuggestionsCubit>();
    relatedSuggestionsCubit.fetchRelatedSuggestions(
        propertyId: widget.propertyId);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Rlated Suggestions',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        BlocBuilder<RelatedSuggestionsCubit, RelatedSuggestionsState>(
          builder: (context, state) {

            if (state is RelatedSuggestionsSuccess) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * .36,
                child: ScrollConfiguration(
                  behavior: ScrollBehavior().copyWith(overscroll: false),
                  child: ListView.builder(
                    itemCount: state.relatedSuggestions.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SizedBox(
                          width: MediaQuery.of(context).size.width * .85,
                          child: PropertyItem(
                            homeModelobject: state.relatedSuggestions[index],
                          ));
                    },
                  ),
                ),
              );
            } else if (state is RelatedSuggestionsFailure) {
              return CustomErrorWidget(errMsg: state.errMsg);
            } else {
              return const CustomLoadingIndicator();
            }
          },
        )
      ],
    );
  }
}
