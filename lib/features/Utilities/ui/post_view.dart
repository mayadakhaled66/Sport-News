import 'package:flutter/material.dart';

class PostCardView extends StatelessWidget {
  String title;
  bool withMoreButton;
  Function moreCallBack;
  Widget cardContent;
EdgeInsets withMargin,withMarginText;
  PostCardView(
      {this.title, this.withMoreButton, this.moreCallBack, this.cardContent,this.withMargin,this.withMarginText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: withMargin??const EdgeInsets.all(15.0).copyWith(top: 20),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: withMarginText??const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: withMoreButton
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                title!=null? Text(title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),):SizedBox(),
                withMoreButton
                    ? FlatButton(onPressed: () {}, child: Text("المزيد",style: TextStyle(color: Colors.blueAccent),))
                    : SizedBox()
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(child: cardContent)
            ],
          ),
        ],
      ),
    );
  }
}
