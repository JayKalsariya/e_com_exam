import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget searchbar({
  required Size size,
}) {
  return SizedBox(
    height: size.height * 0.1,
    // color: Colors.grey,
    child: Row(
      children: [
        Expanded(
          child: TextFormField(
            cursorColor: Colors.grey,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Search here...',
              prefixIcon: Icon(Icons.search_rounded),
              suffixIcon: Icon(CupertinoIcons.mic),
              border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.black),
              ),
              filled: true,
              fillColor: Colors.white60,
            ),
          ),
        ),
      ],
    ),
  );
}
