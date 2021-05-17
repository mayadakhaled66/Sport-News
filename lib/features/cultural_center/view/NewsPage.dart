
import 'package:flutter/material.dart';
import 'package:sport_news/features/Utilities/localization/translation.dart';
import 'package:sport_news/features/cultural_center/model/CardDataModel.dart';
import 'package:sport_news/features/cultural_center/view/NewsDetailsPage.dart';

class NewsPage extends StatelessWidget {
  NewsPage({Key key}) : super(key: key);

  final List<CardDataModel> postCardList = [];

  void initState(BuildContext context) {
    for (int counter = 0; counter < 7; counter++) {
      postCardList.add(CardDataModel(
          details: getTranslated(context, "details_title"),
          date: getTranslated(context, "date"),
          teamName: getTranslated(context, "sport_training"),
          imagePath:
              counter.isEven ? "images/img3@3x.png" : "images/img2@3x.png",
         ));
    }
  }

  @override
  Widget build(BuildContext context) {
    initState(context);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: buildLastPostWidget(context),
      ),
    );
  }

  List<Widget> renderLastPostsList(BuildContext context) {
    List<Widget> listOfLastPostsWidget = [];
    postCardList.forEach((element) {
      listOfLastPostsWidget.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewsDetailsPage(
                          title: element.details,
                          date: element.date,
                          imagePath: element.imagePath,
                          details:getTranslated(context, "details_label"),
                          teamName: element.teamName,
                        )));
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Container(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(element.imagePath),
                                fit: BoxFit.fill,
                                alignment: Alignment.center,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            height:
                                MediaQuery.of(context).size.height * (2 / 12),
                            width:
                                MediaQuery.of(context).size.width * (2.3 / 6),
                          ),
                          Positioned(
                            right: 0.0,
                            bottom: 0.0,
                            child: Image.asset(
                              "images/Group 545@3x.png",
                              height: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      element.teamName,
                      style: TextStyle(
                          color: Color(0xFF534C4C),
                          fontWeight: FontWeight.w500),
                    ),
                    Text(element.details,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600)),
                    Text(
                      element.date,
                      style: TextStyle(
                          color: Color(0xFF534C4C),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ));
    });
    return listOfLastPostsWidget;
  }

  buildLastPostWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        ...renderLastPostsList(context),
      ],
    );
  }
}
