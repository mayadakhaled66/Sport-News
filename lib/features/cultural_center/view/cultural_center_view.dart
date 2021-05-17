import 'package:flutter/material.dart';
import 'package:sport_news/features/Utilities/localization/translation.dart';
import 'package:sport_news/features/Utilities/ui/app_page.dart';
import 'package:sport_news/features/cultural_center/model/CardDataModel.dart';

import 'NewsPage.dart';

class CulturalCenterPage extends StatefulWidget {
  CulturalCenterPage({Key key}) : super(key: key);

  @override
  _CulturalCenterPageState createState() => _CulturalCenterPageState();
}

class _CulturalCenterPageState extends State<CulturalCenterPage>
    with TickerProviderStateMixin {
  List<Widget> list = [
    Tab(text:  "news"),
    Tab(text: "photos"),
    Tab(text: "videos"),
  ];

  final List<CardDataModel> postCardList = [];
  int _selectedIndex = 0;
  TabController _controller;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {


      setData();

    });
    _controller = TabController(length: list.length, vsync: this);
    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }
setData(){
  postCardList.clear();
  list = [
    Tab(text: getTranslated(context, "news")),
    Tab(text: getTranslated(context, "photos")),
    Tab(text: getTranslated(context, "videos")),
  ];
  for (int counter = 0; counter < 5; counter++) {
    postCardList.add(CardDataModel(
        details: getTranslated(context, "details_title"),
        date: getTranslated(context, "date"),
        imagePath: "images/img3@3x.png",
        teamName: getTranslated(context, "sport_training")));

  }
}
  Widget getTapBarWidget(BuildContext context) {
    return TabBarView(
      controller: _controller,
      children: [
        NewsPage(),
        NewsPage(),
        NewsPage(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    setData();
    return AppPage(
      Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/Group 5442@3x.png"),
                  fit: BoxFit.fill,
                  alignment: Alignment.center,
                ),
                color: Theme.of(context).primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0),
                    spreadRadius: -8, //(x,y)
                    blurRadius: 10.0,
                  )
                ],
              ),
              child: TabBar(
                onTap: (index) {
                  // Should not used it as it only called when tab options are clicked,
                  // not when user swapped
                },
                unselectedLabelColor: Colors.white70,
                labelColor: Colors.white,
                controller: _controller,
                tabs: list,
                indicatorWeight: 3,
                labelPadding: const EdgeInsets.all(8.0),
                unselectedLabelStyle: TextStyle(
                    color: Colors.white70, fontWeight: FontWeight.w500),
                indicatorColor: Colors.white,
                labelStyle:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
              ),
            ),
            Expanded(child: getTapBarWidget(context)),
          ],
        ),
      ),
      withAppBar: true,
      withImageInAppBar: true,
    );
  }
}
