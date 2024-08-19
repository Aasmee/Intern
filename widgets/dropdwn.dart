import 'package:flutter/material.dart';

class DropdownButtonWidget extends StatelessWidget {
  final List<String> items;
  final String hint;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;

  const DropdownButtonWidget({
    super.key,
    required this.items,
    required this.hint,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 8),
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          color: const Color(0xFF004225),
          borderRadius: BorderRadius.circular(5),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            hint: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                hint,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
            iconSize: 20,
            isExpanded: true,
            value: selectedValue,
            onChanged: onChanged,
            dropdownColor: Colors.white, // Set dropdown background color
            itemHeight: 50, // Optional: adjust item height
            items: items.map((valueItem) {
              return DropdownMenuItem<String>(
                value: valueItem,
                child: Container(
                  width: double.infinity, // Make sure item takes up full width
                  color: Colors.white, // Background color for each menu item
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12.0),
                    child: Text(
                      valueItem,
                      style: const TextStyle(color: Colors.black), // Text color
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
