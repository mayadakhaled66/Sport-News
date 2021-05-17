import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_news/features/Utilities/ui/app_page.dart';

class NewsDetailsPage extends StatelessWidget {
  String date, imagePath, details, teamName, title;

  NewsDetailsPage(
      {this.date,
      this.imagePath,
      this.details,
      this.teamName,
      this.title,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppPage(
      Container(
        // padding: const EdgeInsets.all(20),
        color: Color(0xFFF3F3F3),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildPostDetailsWidget(context),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      withAppBar: true,
      withBackButton: true,
      withImageInAppBar: false,
    );
  }

  buildPostDetailsWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.fitWidth,
          width: MediaQuery.of(context).size.width + 10,
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 20.0).copyWith(top: 10),
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            teamName,
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Color(0xFF6A6666)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            date,
            style: TextStyle(
                fontWeight: FontWeight.w400, color: Color(0xFF7C7C7C)),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Wrap(
            children: [
              Text(
                details,
                style:
                    TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
              ),
            ],
          ),
        )
      ],
    );
  }
}
