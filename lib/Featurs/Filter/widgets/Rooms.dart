import 'package:flutter/material.dart';

class Rooms extends StatefulWidget {
  final String title;
  late  TextEditingController textEditingController;

  Rooms({
    Key? key,
    required this.title,
    required this.textEditingController
  }) : super(key: key);

  @override
  State<Rooms> createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> with AutomaticKeepAliveClientMixin {

  Map<String, bool> selectedTypes = {
     // Apartment is true by default
    '1': true,
    '2': false,
    '3': false,
    '4': false,
    '5': false,
    '6': false,
    '7': false,
    '8': false,
    '9': false,
    '10': false,
  };

  Map<String, Color> typeColors = {

    '1': const Color(0xffFF725E),
    '2': const Color.fromARGB(255, 250, 250, 250),
    '3': const Color.fromARGB(255, 250, 250, 250),
    '4': const Color.fromARGB(255, 250, 250, 250),
    '5': const Color.fromARGB(255, 250, 250, 250),
    '6': const Color.fromARGB(255, 250, 250, 250),
    '7': const Color.fromARGB(255, 250, 250, 250),
    '8': const Color.fromARGB(255, 250, 250, 250),
    '9': const Color.fromARGB(255, 250, 250, 250),
    '10': const Color.fromARGB(255, 250, 250, 250),
  };
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.textEditingController.text='1';
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    var queryWidth = MediaQuery.of(context).size.width;
    // var queryHeight = MediaQuery.of(context).size.height;
    final double scaleFactor = queryWidth / 300;
    final double paddingSize = 5 * scaleFactor;
    final double containerWidth = 42 * scaleFactor;
    final double containerHeight = 2 * scaleFactor;
    final double textSize = 20 * scaleFactor;

    return Container(
      height: 110 * scaleFactor,
      child: Column(children: [
        Padding(
          padding: EdgeInsets.all(10.0 * scaleFactor),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              widget.title,
              style: TextStyle(fontSize: 22 * scaleFactor),
            ),
          ),
        ),
        SizedBox(
          height: 50 * scaleFactor,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [

              BuildroomRow(
                  text: '1',
                  onTap: () {
                    toggleType('1');
                  },
                  scaleFactor: scaleFactor,
                  containerWidth: containerWidth,
                  containerHeight: containerHeight,
                  paddingSize: paddingSize,
                  textSize: textSize),
              BuildroomRow(
                  text: '2',
                  onTap: () {
                    toggleType('2');
                  },
                  scaleFactor: scaleFactor,
                  containerWidth: containerWidth,
                  containerHeight: containerHeight,
                  paddingSize: paddingSize,
                  textSize: textSize),
              BuildroomRow(
                  text: '3',
                  onTap: () {
                    toggleType('3');
                  },
                  scaleFactor: scaleFactor,
                  containerWidth: containerWidth,
                  containerHeight: containerHeight,
                  paddingSize: paddingSize,
                  textSize: textSize),
              BuildroomRow(
                  text: '4',
                  onTap: () {
                    toggleType('4');
                  },
                  scaleFactor: scaleFactor,
                  containerWidth: containerWidth,
                  containerHeight: containerHeight,
                  paddingSize: paddingSize,
                  textSize: textSize),
              BuildroomRow(
                  text: '5',
                  onTap: () {
                    toggleType('5');
                  },
                  scaleFactor: scaleFactor,
                  containerWidth: containerWidth,
                  containerHeight: containerHeight,
                  paddingSize: paddingSize,
                  textSize: textSize),
              BuildroomRow(
                  text: '6',
                  onTap: () {
                    toggleType('6');
                  },
                  scaleFactor: scaleFactor,
                  containerWidth: containerWidth,
                  containerHeight: containerHeight,
                  paddingSize: paddingSize,
                  textSize: textSize),
              BuildroomRow(
                  text: '7',
                  onTap: () {
                    toggleType('7');
                  },
                  scaleFactor: scaleFactor,
                  containerWidth: containerWidth,
                  containerHeight: containerHeight,
                  paddingSize: paddingSize,
                  textSize: textSize),
              BuildroomRow(
                  text: '8',
                  onTap: () {
                    toggleType('8');
                  },
                  scaleFactor: scaleFactor,
                  containerWidth: containerWidth,
                  containerHeight: containerHeight,
                  paddingSize: paddingSize,
                  textSize: textSize),
              BuildroomRow(
                  text: '9',
                  onTap: () {
                    toggleType('9');
                  },
                  scaleFactor: scaleFactor,
                  containerWidth: containerWidth,
                  containerHeight: containerHeight,
                  paddingSize: paddingSize,
                  textSize: textSize),
              BuildroomRow(
                  text: '10',
                  onTap: () {
                    toggleType('10');
                  },
                  scaleFactor: scaleFactor,
                  containerWidth: containerWidth,
                  containerHeight: containerHeight,
                  paddingSize: paddingSize,
                  textSize: textSize),
            ],
          ),
        ),
      ]),
    );
  }

  Widget BuildroomRow({
    required String text,
    required VoidCallback onTap,
    required double scaleFactor,
    required double containerWidth,
    required double containerHeight,
    required double paddingSize,
    required double textSize,
  }) {
    return Ink(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(paddingSize),
          child: Container(
            height: containerHeight,
            width: containerWidth,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffD9D9D9)),
              color: selectedTypes[text]!
                  ? const Color(0xffFF725E)
                  : const Color(0xffD9D9D9),
              borderRadius: BorderRadius.circular(35 * scaleFactor),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5 * scaleFactor),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: textSize,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void toggleType(String type) {
    setState(() {
      if (selectedTypes[type] == true) {
        selectedTypes[type] = false;
        typeColors[type] = const Color.fromARGB(255, 250, 250, 250);
        widget.textEditingController.clear();
        print(widget.title+':'+widget.textEditingController.text);
      } else {
        selectedTypes.updateAll((key, value) => selectedTypes[key] = false);
        selectedTypes[type] = true;
        typeColors.updateAll((key, value) =>
            typeColors[key] = const Color.fromARGB(255, 250, 250, 250));
        typeColors[type] = const Color.fromARGB(255, 237, 178, 170);
        widget.textEditingController.text =type;
        print(widget.title+':'+widget.textEditingController.text);
      }

    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

// -------------- Data --------------
/* Color colorContainer = const Color(0xffFF725E);
  Color colorText = Color.fromARGB(255, 255, 255, 255);
  List<int> stateOfNO = List.filled(11, 0); // Initialize with 11 elements
  List<Color> colors = List.generate(10, (_) => const Color(0xffD9D9D9));
  List<Color> textColors =
      List.generate(10, (_) => const Color.fromARGB(255, 0, 0, 0));
  // -------------- Data --------------

  @override
  Widget build(BuildContext context) {
    var queryWidth = MediaQuery.of(context).size.width;
    // var queryHeight = MediaQuery.of(context).size.height;
    final double scaleFactor = queryWidth / 400;

    final double containerWidth = 75 * scaleFactor;
    final double containerHeight = 50 * scaleFactor;
    final double textSize = 25 * scaleFactor;

    return Container(
      height: 110 * scaleFactor,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0 * scaleFactor),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                widget.title,
                style: TextStyle(fontSize: 22 * scaleFactor),
              ),
            ),
          ),
          SizedBox(
            height: 50 * scaleFactor,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                // Any
                Padding(
                  padding: EdgeInsets.only(left: 8 * scaleFactor),
                  child: Ink(
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: colorContainer,
                          borderRadius:
                              BorderRadius.circular(100 * scaleFactor),
                        ),
                        child: Center(
                          child: Text(
                            'Any',
                            style:
                                TextStyle(fontSize: textSize, color: colorText),
                          ),
                        ),
                        width: containerWidth,
                        height: containerHeight,
                      ),
                      onTap: () {
                        setState(() {
                          if (colorContainer == const Color(0xffD9D9D9)) {
                            colorContainer = const Color(0xffFF725E);
                            stateOfNO[0] = 1;
                            for (var i = 0; i < 9; i++) {
                              colors[i] = const Color(0xffD9D9D9);
                              textColors[i] = const Color.fromARGB(
                                  255, 0, 0, 0); // Initialize all to 0
                            }
                            for (var i = 1; i < 11; i++) {
                              stateOfNO[i] = 0; // Initialize all to 0
                            }
                          } else {
                            colorContainer = const Color(0xffD9D9D9);
                            stateOfNO[0] = 0;
                          }
                          colorText = colorText == Color.fromARGB(255, 0, 0, 0)
                              ? const Color.fromARGB(255, 255, 255, 255)
                              : const Color.fromARGB(255, 0, 0, 0);
                        });
                        print(stateOfNO);
                      },
                    ),
                  ),
                ),
                // Row OfNo
                Row(
                  children: List.generate(
                    10,
                    (index) {
                      final number = index + 1;
                      return GestureDetector(
                        child: Container(
                          width: 50 * scaleFactor,
                          height: 50 * scaleFactor,
                          margin: EdgeInsets.only(left: 5 * scaleFactor),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(100 * scaleFactor),
                            color: colors[index],
                          ),
                          child: Center(
                            child: Text(
                              '$number',
                              style: TextStyle(
                                  fontSize: textSize, color: textColors[index]),
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            if (colors[index] == const Color(0xffD9D9D9)) {
                              colors[index] = const Color(0xffFF725E);
                              stateOfNO[index + 1] = 1;
                            } else {
                              colors[index] = const Color(0xffD9D9D9);
                              stateOfNO[index + 1] = 0;
                            }
                            textColors[index] = textColors[index] ==
                                    Color.fromARGB(255, 0, 0, 0)
                                ? const Color.fromARGB(255, 255, 255, 255)
                                : const Color.fromARGB(255, 0, 0, 0);
                          });
                          setState(() {
                            List<int> subArray = stateOfNO.sublist(1, 11);
                            if (subArray.every((element) => element == 0)) {
                              colorContainer = const Color(0xffFF725E);
                              colorText = Color.fromARGB(255, 255, 255, 255);
                              stateOfNO[0] = 1;
                              print(stateOfNO);
                            } else {
                              colorContainer = const Color(0xffD9D9D9);
                              colorText = Color.fromARGB(255, 0, 0, 0);
                              stateOfNO[0] = 0;
                              print(stateOfNO);
                            }
                          });
                        },
                      );
                    },
                  ),
                ),
                // End Row OfNo --------------
              ],
            ),
          ),
        ],
      ),
    );
  }*/
