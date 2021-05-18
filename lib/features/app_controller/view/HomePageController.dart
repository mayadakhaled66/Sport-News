import 'package:flutter/material.dart';
import 'package:sport_news/features/Utilities/localization/translation.dart';

import 'package:sport_news/features/cultural_center/view/cultural_center_view.dart';
import 'package:sport_news/features/main_home/view/MainHomePage.dart';
import 'package:sport_news/features/more/view/MorePage.dart';
import 'package:sport_news/features/periodic_table/view/periodic_table_view.dart';
import 'package:sport_news/features/staticties/view/statistics_view.dart';

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
    Future.delayed(Duration.zero, () {
      _incrementTab(0);
    });
  }

  Widget _currentPage;

  PageController _pageController = PageController();

  void _incrementTab(index) {
    _selectedIndex = index;
    setState(() {
      // _pageController.animateToPage(index,
      //     duration: Duration(milliseconds: 500), curve: Curves.easeOut);
      switch (_selectedIndex) {
        case 0:
          _currentPage = MainHomePage();
          break;
        case 1:
          _currentPage = PeriodicPage();
          break;
        case 2:
          _currentPage = CulturalCenterPage();
          break;
        case 3:
          _currentPage = StatisticsPage();
          break;
        case 4:
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
            label: getTranslated(context, 'home_page') ?? ""),
        BottomNavigationBarItem(
            icon: Icon(Icons.view_comfortable),
            label: getTranslated(context, 'per_table') ?? ""),
        BottomNavigationBarItem(
            icon: Icon(Icons.business_center_rounded),
            label: getTranslated(context, 'center') ?? ""),
        BottomNavigationBarItem(
            icon: Icon(Icons.stacked_line_chart),
            label: getTranslated(context, 'statistics') ?? ""),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.more_vert,
            ),
            label: getTranslated(context, 'more') ?? ""),
      ],
      selectedItemColor: Theme.of(context).accentColor,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      unselectedFontSize: 12,
      selectedFontSize: 12,
      unselectedIconTheme: IconThemeData(color: Colors.white70),
      selectedIconTheme: IconThemeData(color: Colors.white),
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
