import 'package:deyarakapp/Featurs/Home/presentation/manager/related_suggestions_cubit/related_suggestions_cubit.dart';
import 'package:flutter/material.dart';
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
    relatedSuggestionsCubit.fetchRelatedSuggestions(propertyId: widget.propertyId);
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
        SizedBox(
          height: MediaQuery.of(context).size.height * .36,
          child: ScrollConfiguration(
            behavior: ScrollBehavior().copyWith(overscroll: false),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SizedBox(
                    width: MediaQuery.of(context).size.width * .85,
                    child: Text(
                        'there was a property item widget here!!') /*PropertyItem(
                      homeModelobject: HomeModel(),
                    )*/
                    );
              },
            ),
          ),
        ),
      ],
    );
  }
}
