import 'package:flutter/material.dart';
import 'package:sport_news/features/Utilities/ui/app_page.dart';
import 'package:sport_news/features/Utilities/ui/post_view.dart';
import 'package:sport_news/features/cultural_center/model/CardDataModel.dart';

class CulturalCenterPage extends StatelessWidget {
   CulturalCenterPage({Key key}) : super(key: key);



    final List<CardDataModel> postCardList = [];

    void initState() {
      for (int counter = 0; counter < 5; counter++) {
        postCardList.add(CardDataModel(
            details: "من الملاعب السعودية إلى منصة التتويج بكأس العالم..",
            date: "12 يوليو 2018",
            imagePath: "images/img3@3x.png",
            teamName: "الدوري الرياضي"));
      }
    }

    @override
    Widget build(BuildContext context) {
      initState();
      return AppPage(
        SingleChildScrollView(
          child: Column(
            children: [
              buildLastPostWidget(context),
            ],
          ),
        ),
        withAppBar: true,
        withImageInAppBar: true,
      );
    }



    List<Widget> renderLastPostsList(BuildContext context) {
      List<Widget> listOfLastPostsWidget = [];
      postCardList.forEach((element) {
        listOfLastPostsWidget.add(
            Row(
              children: [
                Container(
                  // padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  height: MediaQuery.of(context).size.height * (2.5 / 10),
                  width: MediaQuery.of(context).size.width ,
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
                                style:
                                TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                              ),
                              Text(element.date, style:
                              TextStyle(color: Colors.black26, fontWeight: FontWeight.w600),),
                            ],
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
                          child:Wrap(
                            children: [
                              Text(element.details),
                            ],
                          ),),
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

    buildLastPostWidget(BuildContext context) {
      return PostCardView(
        withMargin: const EdgeInsets.all(0.0),
        withMoreButton: true,
        title: "آخر التغريدات",
        moreCallBack: () {},
        cardContent: Column(
          children: [
            ...renderLastPostsList(context),
          ],
        ),
      );
    }

  }


