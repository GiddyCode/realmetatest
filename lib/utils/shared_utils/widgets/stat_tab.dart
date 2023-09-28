import 'package:flutter/material.dart';


class StatTab extends StatelessWidget {
  const StatTab({Key? key, required this.number, required this.name}) : super(key: key);

  final String number;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(number, style: const TextStyle(
        fontSize: 20,
        fontFamily: "ProductSans"),),
        const SizedBox(height: 1),
        Text(name, style: const TextStyle(
            fontSize: 13,
            fontFamily: "ProductSans"),),
      ],
    );
  }
}
