import 'package:flutter/material.dart';

Widget greeting({
  required Size size,
}) {
  return SizedBox(
    height: size.height * 0.1,
    // color: Colors.grey,
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'We have prepared new',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
            letterSpacing: 1,
          ),
        ),
        Text(
          'products FOR YOU ✌',
          style: TextStyle(
            color: Colors.black,
            // fontWeight: FontWeight.bold,
            fontSize: 24,
            // letterSpacing: 1,
          ),
        ),
      ],
    ),
  );
}
