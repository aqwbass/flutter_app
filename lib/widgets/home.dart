import 'package:flutter_boc/widgets/fruad/fruad_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boc/widgets/counter/counter_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class MultipageApphomeState extends StatefulWidget{
  @override
  _MultipageApphomeState createState() => _MultipageApphomeState();
}
class _MultipageApphomeState extends State<MultipageApphomeState>{
  int _selectedIndex = 0 ;
  final List<Widget> tabs = [
    CounterPage(),
    FruadPage(),
    CounterPage(),
    CounterPage(),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: tabs.elementAt(_selectedIndex),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0 , vertical: 8.0),
          child: GNav(
            gap: 8,
            activeColor: Colors.white,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 18.0 , vertical: 5.0),
            duration: Duration(milliseconds:  800),
            tabBackgroundColor: Colors.white30,
            selectedIndex: _selectedIndex,
            tabs: _bottomNavigationBarItemItems(),
            onTabChange: _onItemTapped
          ),
        ),
      ),
    );
  }
  List<GButton> _bottomNavigationBarItemItems() {
    return [
      GButton(
        icon: FontAwesomeIcons.shapes,
        text: 'Couter',
      ),
      GButton(
        icon: FontAwesomeIcons.suitcase,
        text: 'test1',
      ),
      GButton(
        icon: FontAwesomeIcons.search,
        text: 'test2',
      ),
      GButton(
        icon: FontAwesomeIcons.globeAmericas,
        text: 'test3',
      ),
    ];
  }
  
  void _onItemTapped(int index){
    print('index  :    $index') ;
    setState(() => _selectedIndex = index);
  }
}
