import 'package:flutter/material.dart';

class EndOfAddFilter extends StatefulWidget {
  const EndOfAddFilter({
    super.key,
  });

  @override
  State<EndOfAddFilter> createState() => _EndOfAddFilterState();
}

class _EndOfAddFilterState extends State<EndOfAddFilter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(
          flex: 1,
        ),
        const Text(
          'Clear All',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Spacer(
          flex: 5,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffFF725E),
            minimumSize: const Size(150, 50),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(20), // Adjust the value as needed
            ),
          ),
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
          child: const Padding(
            padding: EdgeInsets.zero, // Remove padding from the text
            child: Text(
              'Show 1000 Place',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
        ),
        const Spacer(
          flex: 1,
        ),
      ],
    );
  }
}
