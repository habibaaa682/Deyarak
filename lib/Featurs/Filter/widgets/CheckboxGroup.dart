import 'package:flutter/material.dart';

class CheckboxGroup extends StatefulWidget {
  @override
  _CheckboxGroupState createState() => _CheckboxGroupState();
}

class _CheckboxGroupState extends State<CheckboxGroup>
    with AutomaticKeepAliveClientMixin {
  late double containerWidth;
  late double containerHeight;
  late double leadingSize;
  late double fontSize;

  List<Color> colors = List.generate(14, (_) => Colors.white);

  Map<String, bool?> checkboxValues = {
    'Wifi': false,
    'Kitchen': false,
    'Washer': false,
    'Dryer': false,
    'Iron': false,
    'Smoke Alarm': false,
    'Tv': false,
    'Parking': false,
    'Pool': false,
    'Heating': false,
    'Air Condition': false,
    'Security': false,
    'Batio': false,
    'Power Backup': false,
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var queryWidth = MediaQuery.of(context).size.width;
    final double scaleFactor = queryWidth / 395;
    containerWidth = 187 * scaleFactor;
    containerHeight = 50 * scaleFactor;
    leadingSize = 28 * scaleFactor;
    fontSize = 19 * scaleFactor;

    return Padding(
      padding:
          EdgeInsets.only(left: 18 * MediaQuery.of(context).size.width / 400),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          //--------------------------------------------
          // first column
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < checkboxValues.length / 2; i++)
                buildCheckbox(i),
            ],
          ),
          //--------------------------------------------
          // second column
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = checkboxValues.length ~/ 2;
                  i < checkboxValues.length;
                  i++)
                buildCheckbox(i),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCheckbox(int index) {
    final key = checkboxValues.keys.elementAt(index);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (colors[index] == Colors.white) {
            colors[index] = const Color(0xffFF725E);
            checkboxValues[key] = true;
          } else {
            colors[index] = Colors.white;
            checkboxValues[key] = false;
          }
        });
        print(checkboxValues);
      },
      child: Container(
        height: containerHeight,
        width: containerWidth,
        child: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              height: leadingSize,
              width: leadingSize,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10.0),
                color: colors[index],
              ),
            ),
            title: Text(
              key,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
