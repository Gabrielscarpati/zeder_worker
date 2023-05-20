import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:zeder/ui/features/home/views/dropdown_choose_city.dart';
import 'package:zeder/ui/features/home/views/list_servicos.dart';
import '../../../design_system/parameters/colors.dart';
import '../../../design_system/widgets/search_bar_button.dart';
import '../../templates/diferenciais_card_screen.dart';
import '../chat/chat_screen.dart';
import '../home/home_screen.dart';
import '../select_city/select_city_screen.dart';
import '../service_history/service_history_view.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({super.key});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const SelectCityScreen(),
    const ServiceHistoryView(),
    const ChatScreen(),
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
