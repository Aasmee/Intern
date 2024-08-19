import 'package:flutter/material.dart';

class ChooseType extends StatefulWidget {
  const ChooseType({super.key, required this.title});
  final String title;

  @override
  _ChooseTypeState createState() => _ChooseTypeState();
}

class _ChooseTypeState extends State<ChooseType> {
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
            title: const Center(
              child: Text(
                'Property for Rent',
                style: TextStyle(color: Colors.white),
              ),
            ),
            backgroundColor: const Color(0xFF004225),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          const Center(
            child: Text(
              'Choose the right category of property',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
                child: TextButton(
                  onPressed: () {},
                  child: const Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Residential',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      SizedBox(
                          width:
                              10), // Adjust the width to set the space between the text and icon
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 1.2,
                color: const Color.fromARGB(95, 207, 207, 207),
              ),
              SizedBox(
                height: 60,
                child: TextButton(
                  onPressed: () {},
                  child: const Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Commercial',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      SizedBox(
                          width:
                              10), // Adjust the width to set the space between the text and icon
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 1.2,
                color: const Color.fromARGB(95, 207, 207, 207),
              ),
              SizedBox(
                height: 60,
                child: TextButton(
                  onPressed: () {},
                  child: const Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Room for Rent',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      SizedBox(
                          width:
                              10), // Adjust the width to set the space between the text and icon
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 1.2,
                color: const Color.fromARGB(95, 207, 207, 207),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
