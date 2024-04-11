import 'package:deyarakapp/Featurs/AddProperty/Widgets/AddPropertyBody.dart';
import 'package:flutter/material.dart';

class AddPropertyView extends StatefulWidget {
 const AddPropertyView({Key? key}) : super(key: key);

  @override
  State<AddPropertyView> createState() => _AddPropertyViewState();
}

class _AddPropertyViewState extends State<AddPropertyView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AddPropertyBody(),
    );
  }
}
