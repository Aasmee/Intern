import 'package:flutter/material.dart';

Widget checkBx({
  required bool isChecked,
  required ValueChanged<bool?> onChanged,
  required Widget child, // Changed to Widget to support Column
}) {
  return Row(
    children: [
      Transform.scale(
        scale: 0.8, // Scale down the checkbox
        child: Checkbox(
          value: isChecked,
          onChanged: onChanged,
          materialTapTargetSize: MaterialTapTargetSize
              .shrinkWrap, // Set the size of the checkbox to the smallest possible
          visualDensity: VisualDensity
              .compact, // Ensures that the contents are tightly packed
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
            side: const BorderSide(width: 0.1, color: Colors.white),
          ),
        ),
      ),
      const SizedBox(
        width: 6, // Reduced space between checkbox and text
      ),
      child, // Add the text widget here
    ],
  );
}
