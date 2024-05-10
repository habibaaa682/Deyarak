import 'package:flutter/material.dart';

class PropertyInfoRow extends StatelessWidget {
  const PropertyInfoRow(
      {super.key,
      required this.label,
      required this.value,
      required this.icon});
  final String label;
  final String value;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 90,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Flexible(
            child: Text(
              value,
             softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(
                  color: Color.fromARGB(255, 78, 78, 78),
                  fontWeight: FontWeight.w500),
            ),
          ),
          Icon(
            icon,
            color: Color.fromARGB(255, 99, 99, 99),
          ),
        ],
      ),
    );
  }
}
