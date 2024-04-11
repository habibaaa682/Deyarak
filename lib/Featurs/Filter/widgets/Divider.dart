import 'package:flutter/material.dart';

class Divider_ extends StatefulWidget {
  const Divider_({Key? key});

  @override
  State<Divider_> createState() => _DividerState();
}

class _DividerState extends State<Divider_> {
  late double dividerHeight;
  late double dividerIndent;
  late double dividerEndIndent;
  late double dividerThickness;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    calculateDividerDimensions();
  }

  void calculateDividerDimensions() {
    var queryWidth = MediaQuery.of(context).size.width;
    // var queryHeight = MediaQuery.of(context).size.height;

    final double scaleFactor = queryWidth / 400;
    dividerHeight = 30 * scaleFactor;
    dividerIndent = 20 * scaleFactor;
    dividerEndIndent = 20 * scaleFactor;
    dividerThickness = 0.8 * scaleFactor;
  }

  @override
  Widget build(BuildContext context) {
    calculateDividerDimensions();

    return SizedBox(
      height: dividerHeight,
      child: Divider(
        color: Colors.grey,
        thickness: dividerThickness,
        indent: dividerIndent,
        endIndent: dividerEndIndent,
      ),
    );
  }
}
