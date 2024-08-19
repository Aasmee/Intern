import 'package:flutter/material.dart';

class CustomBackButton extends StatefulWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  _CustomBackButtonState createState() => _CustomBackButtonState();
}

class _CustomBackButtonState extends State<CustomBackButton> {
  bool _isSelected = false; // State variable to manage color switching

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Container(
        padding: const EdgeInsets.all(
            8.0), // Add padding to make the container larger
        decoration: BoxDecoration(
            color: _isSelected
                ? const Color(0xFF004225)
                : Colors.white, // Background color switch
            borderRadius: BorderRadius.circular(5) // Circular shape
            ),
        child: Icon(
          Icons.arrow_back_ios_rounded,
          color: _isSelected
              ? Colors.white
              : const Color(0xFF004225), // Icon color switch
        ),
      ),
      onPressed: () {
        setState(() {
          _isSelected = !_isSelected; // Toggle the state
        });
        Navigator.pop(context); // Pop the current route
      },
    );
  }
}
