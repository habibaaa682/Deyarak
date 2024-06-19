import 'package:deyarakapp/core/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/Models/property_modell/property_modell.dart';

class Owner_Confirmation extends StatefulWidget {
  final PropertyModell propertyModell;
  Owner_Confirmation({
    super.key,
    required this.propertyModell,
  });

  @override
  State<Owner_Confirmation> createState() => _Owner_ConfirmationState();
}

class _Owner_ConfirmationState extends State<Owner_Confirmation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${widget.propertyModell.data!.owner!.name.toString()}'s Confirmed Information ",
            style: Fonts.textstyle16.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 12,
          ),
          confirm(
            confirmation: 'Identity',
          ),
          confirm(
            confirmation: 'Email Address',
          ),
          confirm(
            confirmation: 'Phone Number',
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class confirm extends StatelessWidget {
  String confirmation;
  confirm({super.key, required this.confirmation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(
              Icons.done,
              size: 32,
            ),
          ),
          Text(
            confirmation,
            style: Fonts.textstyle16,
          )
        ],
      ),
    );
  }
}
