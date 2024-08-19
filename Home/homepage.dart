// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:u2app/widgets/dropdwn.dart';
import '../widgets/notification.dart';
import '../widgets/tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String? selectedLocation;
  String? selectedProperty;
  String? selectedRoom;
  bool showNotificationContainer = false; // State variable

  final List<String> listLocation = [
    'Kathmandu',
    'Lalitpur',
    'Bhaktapur',
    'Others'
  ];
  final List<String> listProperty = [
    'Residential',
    'Commercial',
    'Room for rent'
  ];
  final List<String> listRoom = ['Private Room', 'Partition Room', 'Bed Space'];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleNotificationContainer() {
    setState(() {
      showNotificationContainer = !showNotificationContainer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // PreferredSize used to change the size of the app
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        // creates a round rectagular box
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
          // creating app bar
          child: AppBar(
            backgroundColor: const Color(0xFF004225),
            title: Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color(0xFF6C8D7F),
              ),
              child: TextField(
                style: const TextStyle(color: Color(0xFFFFFFFF)),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(color: Colors.white),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 23,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.filter_list,
                      color: Color(0xFFFFFFFF),
                    ),
                    onPressed: () {},
                  ),
                  isDense: true, //minimal use of vertical space
                  contentPadding: const EdgeInsets.symmetric(vertical: 9.0),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 6, top: 5),
                child: NotificationBtn(
                  title: '',
                  onPressed: _toggleNotificationContainer, // Pass the callback
                ),
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      // used so that the contents can use maximum of the available space
                      child: DropdownButtonWidget(
                        items: listLocation,
                        hint: 'Location',
                        selectedValue: selectedLocation,
                        onChanged: (newValue) {
                          setState(() {
                            selectedLocation = newValue;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: DropdownButtonWidget(
                        items: listProperty,
                        hint: 'Property Type',
                        selectedValue: selectedProperty,
                        onChanged: (newValue) {
                          setState(() {
                            selectedProperty = newValue;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: DropdownButtonWidget(
                        items: listRoom,
                        hint: 'Room Type',
                        selectedValue: selectedRoom,
                        onChanged: (newValue) {
                          setState(() {
                            selectedRoom = newValue;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 15), // spacing for the right and left
                  child: Align(
                    alignment: Alignment
                        .centerLeft, // item is vertically in centre and horizontally in left
                    child: Text(
                      'Feature Post',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment
                      .spaceEvenly, // ensures that any two items have equal space between them
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Tile(title: 'Villa Details'),
                    Tile(title: 'Villa Details'),
                    Tile(title: 'Villa Details')
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'View More',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFFE50000),
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFFE50000),
                        ),
                      ),
                      SizedBox(width: 1),
                      Icon(
                        Icons.expand_more_rounded,
                        color: Color(0xFFE50000),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Latest',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Tile(title: 'Villa Details'),
                    Tile(title: 'Villa Details'),
                    Tile(title: 'Villa Details')
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment
                        .center, // places item in the centre horizontally
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'View More',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFFE50000),
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFFE50000),
                        ),
                      ),
                      SizedBox(width: 1),
                      Icon(
                        Icons.expand_more_rounded,
                        color: Color(0xFFE50000),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (showNotificationContainer) // Conditionally show the container
            // manipulate the position of items within 'Stack'
            Positioned(
              top: 0,
              right: 5,
              child: Container(
                padding: const EdgeInsets.all(20),
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(5), //makes the corners rounder
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset:
                              const Offset(0.5, 2) // changes position of sahdow
                          )
                    ]),
                child: const Column(
                  children: [
                    Text(
                      'No notifications',
                      style: TextStyle(
                        color: Color(0xFF5E5E5E),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF004225),
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 5),
              )
            ],
          ),
          //creates navbar
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
            unselectedItemColor: const Color.fromARGB(238, 124, 168, 139),
            currentIndex: _selectedIndex,
            type: BottomNavigationBarType.fixed,
            onTap: _onItemTapped,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle),
                label: 'Add',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.location_on),
                label: 'Maps',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_sharp),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: HomePage(title: 'Home Page'),
  ));
}
