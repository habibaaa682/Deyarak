import 'package:deyarakapp/Featurs/profile/data/models/user/user.profile.dart';
import 'package:deyarakapp/core/utils/fonts.dart';
import 'package:flutter/material.dart';

class confirmation extends StatefulWidget {
  final List<User> userobj;
  confirmation({
    super.key,
    required this.userobj,
  });

  @override
  State<confirmation> createState() => _confirmationState();
}

class _confirmationState extends State<confirmation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${widget.userobj[0].name.toString()}'s Confirmed Information ",
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
