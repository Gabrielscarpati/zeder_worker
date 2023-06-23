import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../design_system/parameters/colors.dart';
import '../chat/chat_screen.dart';
import '../home/home_screen.dart';
import '../show_list_services_standard/show_current_services_screen.dart';
import '../show_list_services_standard/show_new_services_screen.dart';
import '../show_list_services_standard/show_past_services_screen.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({super.key});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const ShowNewServicesScreen(),
    const ShowPastServicesScreen(),
    const ShowCurrentServicesScreen(),
    //const ChatScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
              size: 40,
              color: _selectedIndex==0? DSColors.primary: DSColors.tertiary ,),
            label: 'Casa',
            backgroundColor: DSColors.cardColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search,
                size: 40,
                color:  _selectedIndex==1? DSColors.primary: DSColors.tertiary),
            label: 'Novos Serviços',
            backgroundColor: DSColors.cardColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.folderClock,
                size: 40,
                color: _selectedIndex==2? DSColors.primary: DSColors.tertiary),
            label: 'Serviços passados',
            backgroundColor: DSColors.cardColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.accountHardHat,
                size: 40,
                color: _selectedIndex==3? DSColors.primary: DSColors.tertiary),
            label: 'Atuais',
            backgroundColor: DSColors.cardColor,
          ),
          /*BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble,
                size: 40,
                color:  _selectedIndex==4? DSColors.primary: DSColors.tertiary),
            label: 'Chat',
            backgroundColor: DSColors.cardColor,
          ),*/

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: DSColors.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}
