import 'package:deyarakapp/Featurs/Filter/widgets/FilterBody.dart';
import 'package:flutter/material.dart';

class FilterView extends StatefulWidget {
  const FilterView({Key? key}) : super(key: key);

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FilterBody(),
    );
  }
}
