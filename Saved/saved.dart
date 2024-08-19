import 'package:flutter/material.dart';
import 'package:u2app/widgets/notification.dart';
import 'package:u2app/widgets/tile.dart';

class Fav extends StatefulWidget {
  const Fav({super.key, required String title});

  @override
  _FavState createState() => _FavState();
}

class _FavState extends State<Fav> {
  int _selectedIndex = 0;
  bool showNotificationContainer = false;

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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
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
                  isDense: true,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 12, left: 12),
                  child: Text(
                    'Favourites',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                ListView.builder(
                  itemCount: favoriteItems.length,
                  itemBuilder: (context, index) {
                    return Tile(
                      title: favoriteItems[index],
                    );
                  },
                ),
                if (showNotificationContainer) // Conditionally show the container
                  Positioned(
                    top: 0,
                    right: 5,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: const Offset(
                                  0.5, 2) // changes position of sahdow
                              )
                        ],
                      ),
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
