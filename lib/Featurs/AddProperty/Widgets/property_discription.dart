import 'package:flutter/material.dart';

class PropertyDiscription extends StatefulWidget {
  const PropertyDiscription({
    super.key,
  });

  @override
  State<PropertyDiscription> createState() => _PropertyDiscriptionState();
}

class _PropertyDiscriptionState extends State<PropertyDiscription>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextFormField(
          maxLines: 12,
          minLines: 5,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(14),
              ),
              labelText: 'Description',
              labelStyle: TextStyle(color: Colors.grey))),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
