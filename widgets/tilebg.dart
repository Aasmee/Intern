// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:u2app/widgets/feature.dart';
import 'package:u2app/widgets/verified.dart';

List<String> favoriteItems = [];

class TileBg extends StatefulWidget {
  const TileBg({super.key, required this.title});

  final String title;

  @override
  _TileBgState createState() => _TileBgState();
}

class _TileBgState extends State<TileBg> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool get isFavorite => favoriteItems.contains(widget.title);

  List<String> images = [
    'assets/images/room.jpg',
    'assets/images/villa1.jpeg',
    'assets/images/villa2.jpeg'
  ];

  void _toggleFavorite() {
    setState(() {
      if (isFavorite) {
        favoriteItems.remove(widget.title);
      } else {
        favoriteItems.add(widget.title);
      }
    });
  }

  Widget tileBg() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 8, vertical: 5), // gap around(outside) the container
      child: Container(
        height: 293.5, // Set the height of the container
        padding: const EdgeInsets.all(
            5.0), // gap around the contents of the containers
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(145, 67, 67, 67).withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Column(
          children: [
            // used for positioning any item over other items
            Stack(
              children: [
                SizedBox(
                  height: 150, // Set the height of the image
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                const Positioned(
                  top: 5,
                  left: 5,
                  child: VerifiedContainer(),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: IconButton(
                    iconSize: 20,
                    icon: Icon(
                      isFavorite
                          ? Icons.favorite
                          : Icons
                              .favorite_border, //the icon only has borders by default but when pressed it gets filled
                      color: Colors.white,
                    ),
                    onPressed: _toggleFavorite,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(images.length, (index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 2.5), // Gap between the indicators
                        width: _currentPage == index ? 8 : 6,
                        height: 6,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == index
                              ? Colors.white
                              : Colors.grey,
                        ),
                      );
                    }),
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Rs.6999 Monthly',
                  style: TextStyle(fontSize: 13, color: Colors.black),
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 10,
                    ),
                    SizedBox(width: 3.5),
                    Text(
                      'Location',
                      style: TextStyle(fontSize: 10, color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: [
                    feature('Attached Bathroom'),
                    feature('Fully Furnished'),
                    feature('Near Mall/Supermarket'),
                    feature('Internet/Wifi'),
                    feature('Washing Machine'),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // creates a gap between any two objects by keeping them at the opposite ends
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          SizedBox(
                            height: 35,
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFCDE4FF),
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                              ),
                              label: const Text(
                                'Call',
                                style: TextStyle(fontSize: 14),
                              ),
                              icon: const Icon(
                                Icons.phone,
                                size: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 35,
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFCDE4FF),
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                              ),
                              label: const Text(
                                'Chat',
                                style: TextStyle(fontSize: 14),
                              ),
                              icon: const Icon(
                                Icons.chat,
                                size: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                                color: Color(0xFFE50000),
                                fontSize: 11,
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0xFFE50000)),
                          ),
                          SizedBox(width: 1),
                          Icon(
                            Icons.keyboard_double_arrow_right_rounded,
                            size: 18,
                            color: Color(0xFFE50000),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return tileBg();
  }
}
