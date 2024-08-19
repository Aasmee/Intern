import 'package:flutter/material.dart';

class NotificationBtn extends StatefulWidget {
  const NotificationBtn(
      {super.key, required this.title, required this.onPressed});

  final String title;
  final VoidCallback onPressed;

  @override
  _NotificationBtnState createState() => _NotificationBtnState();
}

class _NotificationBtnState extends State<NotificationBtn> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: _isPressed ? Colors.white : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(
              Icons.notifications,
              color: _isPressed ? const Color(0xFF004225) : Colors.white,
            ),
            onPressed: () {
              setState(() {
                _isPressed = !_isPressed;
              });
              widget.onPressed(); // Call the callback when pressed
            },
          ),
        ),
      ],
    );
  }
}
