import 'package:flutter/material.dart';

class VerifiedContainer extends StatelessWidget {
  const VerifiedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1.5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.verified,
            color: Colors.blue,
            size: 10,
          ),
          SizedBox(width: 2),
          Text(
            'Verified',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 7.5,
            ),
          ),
        ],
      ),
    );
  }
}
