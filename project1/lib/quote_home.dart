import 'dart:math';
import 'package:flutter/material.dart';

class QuoteHomePage extends StatefulWidget {
  const QuoteHomePage({super.key});

  @override
  State<QuoteHomePage> createState() => _QuoteHomePageState();
}

class _QuoteHomePageState extends State<QuoteHomePage> {
  final List<String> _quotes = [
    "Believe in yourself!",
    "Every day is a second chance.",
    "Push yourself, because no one else will do it for you.",
    "Success doesn’t just find you. You have to go out and get it.",
    "Dream big and dare to fail.",
    "You are stronger than you think.",
    "Don’t watch the clock; do what it does. Keep going.",
    "Start where you are. Use what you have. Do what you can.",
  ];

  String _currentQuote = "Tap the button to get inspired!";

  void _generateQuote() {
    final random = Random();
    setState(() {
      _currentQuote = _quotes[random.nextInt(_quotes.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quote Generator")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _currentQuote,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: _generateQuote,
                icon: const Icon(Icons.refresh),
                label: const Text("New Quote"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
