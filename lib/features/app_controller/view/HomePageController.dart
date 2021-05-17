import 'package:flutter/material.dart';

import 'package:sport_news/features/cultural_center/view/cultural_center_view.dart';
import 'package:sport_news/features/main_home/view/MainHomePage.dart';
import 'package:sport_news/features/more/view/MorePage.dart';
import 'package:sport_news/features/periodic_table/view/periodic_table_view.dart';
import 'package:sport_news/features/staticties/view/cultural_center_view.dart';


class HomePageController extends StatefulWidget {
  String userName;

  HomePageController({this.userName});

  @override
  _HomePageControllerState createState() => _HomePageControllerState();
}

class _HomePageControllerState extends State<HomePageController> {
  int _selectedIndex = 0;

  @override
  void initState() {
    _incrementTab(0);
  }

  String _title;
  Widget _currentPage;

  PageController _pageController = PageController();

  void _incrementTab(index) {
    _selectedIndex = index;
    setState(() {
      // _pageController.animateToPage(index,
      //     duration: Duration(milliseconds: 500), curve: Curves.easeOut);
      switch (_selectedIndex) {
        case 0:
          _title = "الصفحه الرئيسيه";
          _currentPage = MainHomePage();
          break;
        case 1:
          _title = "الجدول الدوري";
          _currentPage = PeriodicPage();
          break;
        case 2:
          _title = "المركز الاعلامي";
          _currentPage = CulturalCenterPage();
          break;
        case 3:
          _title = "احصائيات كامله";
          _currentPage = StatisticsPage();
          break;
        case 4:
          _title = "المزيد";
          _currentPage = MorePage();
          break;
      }
    });
  }

  Widget buildBottomBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      currentIndex: _selectedIndex,
      onTap: _incrementTab,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'الصفحه الرئيسيه',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.view_comfortable), label: 'الجدول الدوري'),
        BottomNavigationBarItem(
            icon: Icon(Icons.business_center_rounded),
            label: 'المركز الاعلامي'),
        BottomNavigationBarItem(
            icon: Icon(Icons.stacked_line_chart), label: 'احصائيات كامله'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.more_vert,
            ),
            label: 'المزيد'),
      ],

      selectedItemColor: Theme.of(context).accentColor,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      unselectedFontSize: 12,
      selectedFontSize: 12,
      unselectedIconTheme: IconThemeData(color: Colors.white70),
      selectedIconTheme: IconThemeData(color:  Colors.white),
      unselectedLabelStyle: TextStyle(color: Colors.white70),
      selectedLabelStyle: TextStyle(color: Colors.white),
      unselectedItemColor: Colors.white70,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomBar(context),
      body: _currentPage,
    );
  }
}
