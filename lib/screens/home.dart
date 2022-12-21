import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const String keyIndexSelected = 'selectedIndex';

  static List<Widget> pages = [
    MainScreen(),
    AboutScreen(),
    SupportDeveloperScreen(),
  ];

  @override
  void initState() {
    super.initState();
    getSavedScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          saveCurrentScreen();
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_people),
            label: 'Support Developer',
          ),
        ],
      ),
    );
  }

  void saveCurrentScreen() async {
    final prefs = await SharedPreferences.getInstance();
    print("Screen Saved!!!");
    prefs.setInt(keyIndexSelected, _selectedIndex);
  }

  void getSavedScreen() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(keyIndexSelected)) {
      setState(() {
        final index = prefs.getInt(keyIndexSelected);
        if (index != null) {
          _selectedIndex = index;
        }
      });
    }
  }
}
