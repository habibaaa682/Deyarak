import 'package:flutter/material.dart';

class RelatedSuggestion extends StatelessWidget {
  const RelatedSuggestion({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ScrollConfiguration(
        behavior: ScrollBehavior().copyWith(overscroll: false),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return SizedBox(
                width: MediaQuery.of(context).size.width * .7,
                height: MediaQuery.of(context).size.height * .9,
                child: Text(
                    'there was a property item widget here!!') /* const PropertyItem(
                  homeModelobject: HomeModel(),
                )*/
                );
          },
        ),
      ),
    );
  }
}
