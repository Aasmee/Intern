import 'package:flutter/material.dart';

Widget feature(String labelText) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 2.5, vertical: 1.5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
          width: 0.8, color: const Color.fromARGB(213, 223, 223, 223)),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.check,
          color: Colors.green,
          size: 13,
        ),
        const SizedBox(width: 1),
        Text(
          labelText,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 9,
          ),
        ),
      ],
    ),
  );
}
