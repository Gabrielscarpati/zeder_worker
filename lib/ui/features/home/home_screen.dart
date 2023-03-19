import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../design_system/parameters/colors.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            icon: Icon(Icons.home,
              size: 40,
              color: _selectedIndex==0? DSColors.primary: DSColors.tertiary ,),
            label: '',
            backgroundColor: DSColors.cardColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search,
                size: 40,
                color:  _selectedIndex==1? DSColors.primary: DSColors.tertiary),
            label: '',
            backgroundColor: DSColors.cardColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.bookMarkerOutline,
                size: 40,
                color: _selectedIndex==2? DSColors.primary: DSColors.tertiary),
            label: '',
            backgroundColor: DSColors.cardColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble,
                size: 40,
                color:  _selectedIndex==3? DSColors.primary: DSColors.tertiary),
            label: '',
            backgroundColor: DSColors.cardColor,
          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: DSColors.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}
