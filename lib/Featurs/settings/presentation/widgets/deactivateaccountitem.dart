import 'package:deyarakapp/core/utils/fonts.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class deactivateaccountitemwidget extends StatelessWidget {
  String base;
  String hint;

  deactivateaccountitemwidget({
    super.key,
    required this.base,
    required this.hint,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.045),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    base,
                    style: Fonts.textstyle24,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    hint,
                    style: Fonts.textstyle16.copyWith(color: Color(0xff6B6767)),
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ],
      ),
    );
  }
}
