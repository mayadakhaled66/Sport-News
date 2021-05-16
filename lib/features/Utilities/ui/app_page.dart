import 'package:flutter/material.dart';

class AppPage extends StatelessWidget {
  bool withAppBar, withImageInAppBar, withBackButton;
  Widget pageContent;

  AppPage(this.pageContent,
      {this.withAppBar, this.withImageInAppBar, this.withBackButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0x1E707070),
      appBar: withAppBar
          ? PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*(2/15)),
            child: AppBar(
                // title: Text('App Bar!'),
                flexibleSpace: withImageInAppBar
                    ? Image(
                        image: AssetImage('images/app_bar.png'),
                        fit: BoxFit.cover,
                      )
                    : SizedBox(),
                backgroundColor: Colors.transparent,
              ),
          )
          : SizedBox(),
      resizeToAvoidBottomInset: true,
      body: this.pageContent,
    );
  }
}
