import 'package:flutter/material.dart';

class PropertyType extends StatefulWidget {
  late  TextEditingController textEditingController;
  PropertyType({super.key,required this.textEditingController});

  @override
  State<PropertyType> createState() => _PropertyTypeState();
}

class _PropertyTypeState extends State<PropertyType>
    with AutomaticKeepAliveClientMixin {
  Map<String, bool> selectedTypes = {
    'apartment': true, // Apartment is true by default
    'furnished apartment': false,
    'family house': false,
    'villa': false,
  };

  Map<String, Color> typeColors = {
    'apartment': const Color(0xffFF725E),
    'furnished apartment': const Color.fromARGB(255, 250, 250, 250),
    'family house': const Color.fromARGB(255, 250, 250, 250),
    'villa': const Color.fromARGB(255, 250, 250, 250),
  };
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.textEditingController.text='apartment';
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var queryWidth = MediaQuery.of(context).size.width;
    final double scaleFactor = queryWidth / 400;
    final double containerWidth = 165 * scaleFactor;
    final double containerHeight = 120 * scaleFactor;
    final double paddingSize = 10 * scaleFactor;
    final double imageSize = 55 * scaleFactor;
    final double textSize = 16.5 * scaleFactor;

    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Spacer(flex: 1),
              _buildImageRow(
                image: 'assets/images/apartment.png',
                text: 'apartment',
                onTap: () => _toggleType('apartment'),
                scaleFactor: scaleFactor,
                imageSize: imageSize,
                containerWidth: containerWidth,
                containerHeight: containerHeight,
                paddingSize: paddingSize,
                textSize: textSize * 1.1,
              ),
              Spacer(flex: 2),
              _buildImageRow(
                image: 'assets/images/furniture (1).png',
                text: 'furnished apartment',
                onTap: () => _toggleType('furnished apartment'),
                scaleFactor: scaleFactor,
                imageSize: imageSize,
                containerWidth: containerWidth,
                containerHeight: containerHeight,
                paddingSize: paddingSize,
                textSize: textSize * 0.95,
              ),
              Spacer(flex: 1),
            ],
          ),
          Row(
            children: [
              Spacer(flex: 1),
              _buildImageRow(
                image: 'assets/images/home (1).png',
                text: 'family house',
                onTap: () => _toggleType('family house'),
                scaleFactor: scaleFactor,
                imageSize: imageSize,
                containerWidth: containerWidth,
                containerHeight: containerHeight,
                paddingSize: paddingSize,
                textSize: textSize,
              ),
              Spacer(flex: 2),
              _buildImageRow(
                image: 'assets/images/villaa.png',
                text: 'villa',
                onTap: () => _toggleType('villa'),
                scaleFactor: scaleFactor,
                imageSize: imageSize,
                containerWidth: containerWidth,
                containerHeight: containerHeight,
                paddingSize: paddingSize,
                textSize: textSize * 1.1,
              ),
              Spacer(flex: 1),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImageRow({
    required String image,
    required String text,
    required VoidCallback onTap,
    required double scaleFactor,
    required double imageSize,
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
              border: Border.all(color: Colors.black),
              color: selectedTypes[text]!
                  ? const Color(0xffFF725E)
                  : const Color.fromARGB(255, 250, 250, 250),
              borderRadius: BorderRadius.circular(15 * scaleFactor),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(image, width: imageSize, height: imageSize),
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

  void _toggleType(String type) {
    setState(() {
      if (selectedTypes[type] == true) {
        selectedTypes[type] = false;
        typeColors[type] = const Color.fromARGB(255, 250, 250, 250);
      } else {
        selectedTypes.updateAll((key, value) => selectedTypes[key] = false);
        selectedTypes[type] = true;
        typeColors.updateAll((key, value) =>
            typeColors[key] = const Color.fromARGB(255, 250, 250, 250));
        typeColors[type] = const Color.fromARGB(255, 237, 178, 170);
      }
      widget.textEditingController.text =type;
      print(selectedTypes);
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
