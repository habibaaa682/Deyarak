import 'package:flutter/material.dart';

class Rang_Slider extends StatefulWidget {
  final String title;
  final String kind;
  final double initialMinPrice;
  final double initialMaxPrice;

  Rang_Slider({
    Key? key,
    required this.title,
    required this.kind,
    required this.initialMinPrice,
    required this.initialMaxPrice,
  }) : super(key: key);

  @override
  State<Rang_Slider> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Rang_Slider>
    with AutomaticKeepAliveClientMixin {
  late double _minPrice;
  late double _maxPrice;
  late TextEditingController _minPriceController;
  late TextEditingController _maxPriceController;

  @override
  void initState() {
    super.initState();
    _minPrice = widget.initialMinPrice;
    _maxPrice = widget.initialMaxPrice;
    _minPriceController = TextEditingController(text: _minPrice.toString());
    _maxPriceController = TextEditingController(text: _maxPrice.toString());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var queryWidth = MediaQuery.of(context).size.width;
    var queryHeight = MediaQuery.of(context).size.height;

    double titleFontSize = queryWidth * 0.09;
    double textFieldFontSize = queryWidth * 0.04;
    double textFieldHeight = queryHeight * 0.08;
    double containerWidth = queryWidth * 0.39;

    return SizedBox(
      height: queryHeight * 0.23,
      child: Column(
        children: [
          // Title
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: queryWidth * 0.02),
              child: Text(
                widget.title,
                style: TextStyle(fontSize: titleFontSize),
              ),
            ),
          ),

          // RangeSlider
          RangeSlider(
            values: RangeValues(_minPrice, _maxPrice),
            divisions: 100,
            labels: RangeLabels(
              _minPrice.toString(),
              _maxPrice.toString(),
            ),
            min: widget.initialMinPrice,
            max: widget.initialMaxPrice,
            activeColor: const Color(0xffFF725E),
            inactiveColor: const Color.fromARGB(79, 0, 0, 0),
            onChanged: (newValues) {
              setState(() {
                _minPrice = newValues.start;
                _maxPrice = newValues.end;
                _minPriceController.text = _minPrice.toString();
                _maxPriceController.text = _maxPrice.toString();
              });
            },
          ),

          // Row Of TextFields
          Row(
            children: [
              Spacer(flex: 1),
              SizedBox(
                height: textFieldHeight,
                width: containerWidth,
                child: TextField(
                  controller: _minPriceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    suffixText: '${widget.kind}   ',
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: containerWidth * 0.07,
                        vertical: textFieldHeight * .8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    labelText: 'Minimum',
                    labelStyle: TextStyle(
                      fontSize: textFieldFontSize,
                    ),
                  ),
                  onChanged: (val) {
                    setState(() {
                      double parsedValue = double.tryParse(val) ?? 0;
                      _minPrice =
                          parsedValue.clamp(widget.initialMinPrice, _maxPrice);
                    });
                  },
                ),
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     border: Border.all(color: const Color.fromARGB(106, 0, 0, 0)),
              //     borderRadius: BorderRadius.circular(queryWidth * 0.03),
              //   ),
              //   height: textFieldHeight,
              //   width: containerWidth,
              //   child: Padding(
              //     padding: EdgeInsets.only(left: queryWidth * 0.015),
              //     child: TextFormField(
              //       controller: _minPriceController,
              //       keyboardType: TextInputType.number,
              //       // cursorColor: Colors.black,
              //       decoration: InputDecoration(
              //         suffixText: '${widget.kind}   ',
              //         border: InputBorder.none,
              //         labelText: 'Minimum',
              //         labelStyle: TextStyle(
              //           fontSize: textFieldFontSize,
              //           // color: Colors.black,
              //         ),
              //       ),
              //       onChanged: (val) {
              //         setState(() {
              //           double parsedValue = double.tryParse(val) ?? 0;
              //           _minPrice = parsedValue.clamp(
              //               widget.initialMinPrice, _maxPrice);
              //         });
              //       },
              //     ),
              //   ),
              // ),
              Spacer(flex: 2),
              SizedBox(
                height: textFieldHeight,
                width: containerWidth,
                child: TextField(
                  controller: _maxPriceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    suffixText: '${widget.kind}   ',
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: containerWidth * 0.07,
                        vertical: textFieldHeight * .8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    labelText: 'Maximum',
                    labelStyle: TextStyle(
                      fontSize: textFieldFontSize,
                    ),
                  ),
                  onChanged: (val) {
                    setState(() {
                      double parsedValue = double.tryParse(val) ?? 50000;
                      _maxPrice =
                          parsedValue.clamp(_minPrice, widget.initialMaxPrice);
                    });
                  },
                ),
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     border: Border.all(color: const Color.fromARGB(106, 0, 0, 0)),
              //     borderRadius: BorderRadius.circular(queryWidth * 0.03),
              //   ),
              //   height: textFieldHeight,
              //   width: containerWidth,
              //   child: Padding(
              //     padding: EdgeInsets.only(left: queryWidth * 0.015),
              //     child: TextFormField(
              //       controller: _maxPriceController,
              //       keyboardType: TextInputType.number,
              //       // cursorColor: Colors.black,
              //       decoration: InputDecoration(
              //         suffixText: '${widget.kind}   ',
              //         border: InputBorder.none,
              //         labelText: 'Maximum',
              //         labelStyle: TextStyle(
              //           fontSize: textFieldFontSize,
              //           // color: Colors.black,
              //         ),
              //       ),
              //       onChanged: (val) {
              //         setState(() {
              //           double parsedValue = double.tryParse(val) ?? 50000;
              //           _maxPrice = parsedValue.clamp(
              //               _minPrice, widget.initialMaxPrice);
              //         });
              //       },
              //     ),
              //   ),
              // ),
              Spacer(flex: 1),
            ],
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
