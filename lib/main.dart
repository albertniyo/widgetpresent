import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/cart.dart';
import 'screens/about.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruit Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const MainScreen(),
    );
  }
}

/* main screen that holds the BottomNavigationBar and switches between
 * three child screens: home, cart and profile
*/
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  /* current index of the bottom navigation bar where 0 go for Home, 
   * 1 go for Cart, 2 go for  Profile 
   */
  int _selectedIndex = 0;

  // list of screens where each screen is a StatelessWidget that returns the body content
  final List<Widget> _pages = const [HomeScreen(), CartScreen(), AboutScreen()];

  // titles for the AppBar that change when the user switches tabs
  final List<String> _titles = const ['Fruit Store', 'Cart', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar title changes dynamically based on the selected tab.
      appBar: AppBar(
        title: Text(
          _titles[_selectedIndex],
          style: const TextStyle(color: Colors.white, fontSize: 28),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      // body shows the currently selected screen.
      body: _pages[_selectedIndex],
      // BottomNavigationBar widget
      bottomNavigationBar: BottomNavigationBar(
        // currentIndex property
        currentIndex: _selectedIndex,

        // onTap property
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },

        // items property
        // default is an empty list where each item has an icon and a label
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],

        // select item color property
        selectedItemColor:
            Colors.deepPurple, // changes the color of the selected icon/label
      ),
    );
  }
}
