import 'package:flutter/material.dart';

Widget horitxt(String labelText, {String hintText = ''}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(labelText),
      Container(
        width: 160,
        height: 45,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 221, 221, 221),
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
            contentPadding: const EdgeInsets.symmetric(
                vertical: 11.0), // Adjust vertical padding here
          ),
        ),
      ),
    ],
  );
}
