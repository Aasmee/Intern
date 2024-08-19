// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:u2app/widgets/feature.dart';
import 'package:u2app/widgets/verified.dart';

List<String> favoriteItems = []; //Global list to track favourite itmes

class Tile extends StatefulWidget {
  final String title;

  const Tile({super.key, required this.title});

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
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

  Widget tile() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 5), //padding or spacing around(outside) the tile
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(145, 67, 67, 67).withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2), // changes position of shadow
            )
          ],
        ),
        child: Row(
          children: [
            Stack(
              children: [
                // Image carousel slider with custom indicator
                SizedBox(
                  width: 130,
                  height: 115,
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
                // Custom indicator
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
                ),
              ],
            ),
            const SizedBox(
                width: 10), // gap between the picture and the content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // left alignment
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // separates or creates a gap the texts from the icon
                    children: [
                      const Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // left alignment
                        children: [
                          Text(
                            'Room',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Rs.6999 Monthly',
                            style: TextStyle(
                              fontSize: 10.5,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        iconSize: 20,
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: const Color(0xFFE50000),
                        ),
                        onPressed: _toggleFavorite,
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 3,
                    runSpacing: 3,
                    children: [
                      feature('Attached Bathroom'),
                      feature('Fully Furnished'),
                      feature('Near Mall/Supermarket'),
                      feature('Internet/Wifi'),
                      feature('Washing Machine'),
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 10,
                      ),
                      SizedBox(width: 3.5), // gap between the text and the icon
                      Text(
                        'Location',
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return tile();
  }
}
