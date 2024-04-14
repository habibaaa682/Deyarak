import 'package:flutter/material.dart';

class Slider_M extends StatefulWidget {
  final String title;
  final String kind;
  final double initialValue;

  Slider_M({
    super.key,
    required this.title,
    required this.kind,
    required this.initialValue,
  });

  @override
  State<Slider_M> createState() => _Slider_MState();
}

class _Slider_MState extends State<Slider_M>
    with AutomaticKeepAliveClientMixin {
  late TextEditingController Controller;
  late double value;
  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
    Controller = TextEditingController(text: value.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 70,
                  width: 165,
                  child: TextField(
                    controller: Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      suffixText: '${widget.kind}   ',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      hintText: "$value",
                      labelText: widget.title,
                      labelStyle: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (val) {
                      setState(() {
                        double parsedValue = double.tryParse(val) ?? 50000;
                        value = parsedValue.clamp(0.0, widget.initialValue);
                      });
                    },
                  ),
                ),
                // Container(
                //   height: 70,
                //   width: 165,
                //   decoration: BoxDecoration(
                //     border: Border.all(color: Color.fromARGB(60, 8, 2, 2)),
                //     borderRadius: BorderRadius.circular(20),
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.only(left: 7),
                //     child: TextFormField(
                //       controller: Controller,
                //       keyboardType: TextInputType.number,
                //       cursorColor: Colors.black,
                //       decoration: InputDecoration(
                //         suffixText: '${widget.kind}   ',
                //         border: InputBorder.none,
                //         labelText: widget.title,
                //         labelStyle: const TextStyle(
                //             fontSize: 19, color: Color.fromARGB(255, 0, 0, 0)),
                //       ),
                //       onChanged: (val) {
                //         setState(() {
                //           double parsedValue = double.tryParse(val) ?? 50000;
                //           value = parsedValue;
                //         });
                //       },
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
        Slider(
          activeColor: const Color(0xffFF725E),
          inactiveColor: const Color.fromARGB(79, 0, 0, 0),
          value: value,
          label: value.toString(),
          divisions: 100,
          min: 0.0,
          max: widget.initialValue,
          onChanged: (newValue) {
            setState(() {
              value = newValue;
              Controller.text = value.toString();
            });
          },
        )
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
