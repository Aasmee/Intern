// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:u2app/widgets/backbtn.dart';
import 'package:u2app/widgets/checkbox.dart';

class FormFinal extends StatefulWidget {
  const FormFinal({super.key, required this.title});
  final String title;

  @override
  _FormFinalState createState() => _FormFinalState();
}

class _FormFinalState extends State<FormFinal> {
  final _formKey = GlobalKey<FormState>();
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
          child: AppBar(
            leading: const CustomBackButton(),
            title: const Center(
              child: Text(
                'Property for Rent',
                style: TextStyle(color: Colors.white),
              ),
            ),
            backgroundColor: const Color(0xFF004225),
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Select a package that works for you',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              const Divider(
                color: Color.fromARGB(138, 200, 200, 200),
                thickness: 1.5,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(13.0),
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(154, 230, 230, 230),
                          width: 1.5, // thickness of the border
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            width: 155,
                            child: Image.asset(
                              'assets/images/room.jpg', // Reference the asset image correctly
                              fit: BoxFit
                                  .cover, // Optionally specify how the image should fit
                            ),
                          ),
                          const SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Room',
                                style: TextStyle(fontSize: 20, height: 1),
                              ),
                              const Text(
                                'Rs.6999 Monthly',
                                style: TextStyle(fontSize: 13),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 1),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0x9ACFCFCF),
                                      width: 1.3),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Text(
                                  'Badges will appear here',
                                  style: TextStyle(fontSize: 9),
                                ),
                              ),
                              const SizedBox(height: 15),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 12,
                                  ),
                                  SizedBox(
                                      width:
                                          3), // Added space between Icon and Text
                                  Text(
                                    'Location',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors
                            .white, // Set the background color of the container
                        border: Border.all(
                          color:
                              const Color(0x9ACFCFCF), // Set the border color
                          width: 1.5, // Set the border width
                        ),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(
                                0x9ACFCFCF), // Grey shadow with some opacity
                            spreadRadius: 1, // Spread radius
                            blurRadius: 7, // Blur radius
                            offset: Offset(0,
                                1.5), // Shadow position: (horizontal, vertical)
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment
                              .center, // Center elements vertically
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            checkBx(
                              isChecked: isChecked1,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked1 = value ?? false;
                                });
                              },
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Basic',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      height: 1.2,
                                    ),
                                  ),
                                  Text(
                                    'Normal Visibility',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width:
                                  8, // Add some spacing between the checkbox and the text
                            ),
                            const Text(
                              'Rs. 00',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFFE50000),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors
                            .white, // Set the background color of the container
                        border: Border.all(
                          color:
                              const Color(0x9ACFCFCF), // Set the border color
                          width: 1.5, // Set the border width
                        ),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(
                                0x9ACFCFCF), // Grey shadow with some opacity
                            spreadRadius: 1, // Spread radius
                            blurRadius: 7, // Blur radius
                            offset: Offset(0,
                                1.5), // Shadow position: (horizontal, vertical)
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Verification',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                height: 1),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Obtain a verified mark on the top right corner of your listing',
                            style: TextStyle(fontSize: 12),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 13, vertical: 8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(
                                    0x9ACFCFCF), // Set the border color
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                checkBx(
                                    isChecked: isChecked2,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked2 = value ?? false;
                                      });
                                    },
                                    child: const Text('Verify')),
                                const Text('+ Rs.189'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors
                            .white, // Set the background color of the container
                        border: Border.all(
                          color:
                              const Color(0x9ACFCFCF), // Set the border color
                          width: 1.5, // Set the border width
                        ),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(
                                0x9ACFCFCF), // Grey shadow with some opacity
                            spreadRadius: 1, // Spread radius
                            blurRadius: 7, // Blur radius
                            offset: Offset(0,
                                1.5), // Shadow position: (horizontal, vertical)
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Featured Ad',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                height: 1),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Featured ads are placed on top of everything',
                            style: TextStyle(fontSize: 12),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 13, vertical: 8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(
                                    0x9ACFCFCF), // Set the border color
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                checkBx(
                                    isChecked: isChecked3,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked3 = value ?? false;
                                      });
                                    },
                                    child:
                                        const Text('Featured Ad for 7 Days')),
                                const Text('+ Rs.289'),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 13, vertical: 8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(
                                    0x9ACFCFCF), // Set the border color
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                checkBx(
                                    isChecked: isChecked4,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked4 = value ?? false;
                                      });
                                    },
                                    child:
                                        const Text('Featured Ad for 14 Days')),
                                const Text('+ Rs.399'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Form submission logic
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: const Color(0xFF004225),
                          foregroundColor:
                              Colors.white, // Set the text color to white
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(7), // No border radius
                          ),
                        ),
                        child: const Text(
                          'Confirm',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
