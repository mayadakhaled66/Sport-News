import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sport_news/features/Utilities/localization/translation.dart';
import 'package:sport_news/features/Utilities/ui/app_page.dart';
import 'package:sport_news/features/Utilities/ui/post_view.dart';
import 'package:sport_news/features/main_home/model/HomeTeamModel.dart';
import 'package:sport_news/features/main_home/model/HomeTeamSupporters.dart';
import 'package:sport_news/features/main_home/model/LastPosts.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key key}) : super(key: key);

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  List<HomeTeamModel> teamsList = [];
  List<HomeTeamSupporters> teamsSupportersList = [];
  List<LastPosts> lastPostsList = [];

  setDataToList() {
    teamsList.clear();
    teamsSupportersList.clear();
    lastPostsList.clear();
    for (int counter = 0; counter < 3; counter++) {
      teamsList.add(HomeTeamModel(
          time: "22:00",
          date: getTranslated(context, "date"),
          imagePath: "images/logo-club-foot-png-2@3x.png",
          team1Name: getTranslated(context, "teamName"),
          team2Name: getTranslated(context, "teamName")));
      teamsSupportersList.add(HomeTeamSupporters(
          expectation: "%50",
          imagePath: "images/logo-club-foot-png-2@3x.png",
          teamName: getTranslated(context, "teamName")));
    }
    lastPostsList.add(LastPosts(
        imagePath: "images/5TRrpRAGc@3x.png",
        accountId: "@account",
        teamName: getTranslated(context, "sport_training"),
        details: getTranslated(context, "details")));
    lastPostsList.add(LastPosts(
        imagePath: "images/5TRrpRAGc@3x.png",
        accountId: "@account",
        teamName: getTranslated(context, "sport_training"),
        details: getTranslated(context, "details")));
  }

  @override
  Widget build(BuildContext context) {
    setDataToList();
    return AppPage(
      SingleChildScrollView(
        child: Column(
          children: [
            buildLastNewsWidget(),
            buildLastComingNewsWidget(),
            buildLastPostWidget(),
            buildExpectationWidget(),
            buildVideosWidget(),
            buildSupportersWidget()
          ],
        ),
      ),
      withAppBar: true,
      withImageInAppBar: true,
    );
  }

  buildLastComingNewsWidget() {
    return PostCardView(
      withMargin: const EdgeInsets.all(0.0),
      withMoreButton: true,
      title: getTranslated(context, "coming_match"),
      moreCallBack: () {},
      cardContent: Column(
        children: [
          ...renderTeamList(),
        ],
      ),
    );
  }

  List<Widget> renderTeamList() {
    List<Widget> listOfTeamWidget = [];
    teamsList.forEach((element) {
      listOfTeamWidget.add(Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * (1 / 15),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.white),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      element.imagePath,
                      height: 50,
                      width: 50,
                    ),
                    Text(
                      element.team1Name,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(element.time),
                    Text(element.date),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      element.team2Name,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    Image.asset(
                      element.imagePath,
                      height: 50,
                      width: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            thickness: 0.5,
            height: 0.8,
          ),
        ],
      ));
    });
    return listOfTeamWidget;
  }

  List<Widget> renderTeamSupporterList() {
    List<Widget> listOfTeamWidget = [];
    teamsSupportersList.forEach((element) {
      listOfTeamWidget.add(Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
            width: MediaQuery.of(context).size.width / 3,
            decoration: BoxDecoration(color: Colors.white),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          element.imagePath,
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                    Text(
                      element.teamName,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    Text(element.expectation),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            thickness: 0.5,
            height: 0.8,
          ),
        ],
      ));
    });
    return listOfTeamWidget;
  }

  List<Widget> renderLastPostsList() {
    List<Widget> listOfLastPostsWidget = [];
    lastPostsList.forEach((element) {
      listOfLastPostsWidget.add(Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * (2.5 / 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        element.imagePath,
                        height: 50,
                        width: 50,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          element.teamName,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          element.accountId,
                          style: TextStyle(
                              color: Colors.black26,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Wrap(
                      children: [
                        Text(element.details),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Divider(
                    thickness: 2,
                    height: 0.8,
                  ),
                ),
              ],
            ),
          ),
        ],
      ));
    });
    return listOfLastPostsWidget;
  }

  buildExpectationWidget() {
    return PostCardView(
      withMargin: const EdgeInsets.all(0.0),
      withMoreButton: false,
      title: getTranslated(context, "who_winner"),
      moreCallBack: () {},
      cardContent: Row(
        children: [
          ...renderTeamSupporterList(),
        ],
      ),
    );
  }

  buildSupportersWidget() {
    return PostCardView(
      withMargin: const EdgeInsets.all(0.0),
      withMoreButton: false,
      title: getTranslated(context, "Sponsors"),
      moreCallBack: () {},
      cardContent: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
          decoration: BoxDecoration(color: Colors.white),
          child: Row(
            children: [
              Expanded(
                  flex: 2, child: Image.asset("images/Symbol 2 – 1@3x.png")),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  flex: 2, child: Image.asset("images/Symbol 2 – 1@3x.png")),
            ],
          ),
        ),
      ),
    );
  }

  buildLastPostWidget() {
    return PostCardView(
      withMargin: const EdgeInsets.all(0.0),
      withMoreButton: true,
      title: getTranslated(context, "last_posts"),
      moreCallBack: () {},
      cardContent: Column(
        children: [
          ...renderLastPostsList(),
        ],
      ),
    );
  }

  buildLastNewsWidget() {
    return PostCardView(
      withMoreButton: true,
      title: getTranslated(context, "last_news"),
      moreCallBack: () {},
      cardContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            child: Align(
              alignment: Alignment.topCenter,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/img@3x.png"),
                        fit: BoxFit.fill,
                        alignment: Alignment.center,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: MediaQuery.of(context).size.height * (2 / 6),
                    width: MediaQuery.of(context).size.width,
                  ),
                  Positioned(
                    right: 0.0,
                    bottom: 0.0,
                    child: Image.asset(
                      "images/Group 545@3x.png",
                      height: 50,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            getTranslated(context, "sport_training"),
            style: TextStyle(color: Color(0xFF7C7575), fontSize: 14),
          ),
          Text(
            getTranslated(context, "details_title"),
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  buildVideosWidget() {
    return PostCardView(
      withMoreButton: false,
      title: getTranslated(context, "videos"),
      moreCallBack: () {},
      withMargin: const EdgeInsets.all(0.0),
      cardContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Container(
              margin: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/Image@3x.png"),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.center,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              height: MediaQuery.of(context).size.height * (2 / 6),
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ],
      ),
    );
  }
}
