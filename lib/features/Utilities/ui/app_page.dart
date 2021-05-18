import 'package:flutter/material.dart';

class AppPage extends StatelessWidget {
  bool withAppBar, withImageInAppBar, withBackButton, extendBodyBehindAppBar;
  Widget pageContent;
  Color backgroundColor;

  AppPage(this.pageContent,
      {this.backgroundColor,
      this.withAppBar = false,
      this.withImageInAppBar = false,
      this.withBackButton = false,
      this.extendBodyBehindAppBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: this.backgroundColor ?? Colors.transparent,
      extendBodyBehindAppBar: this.extendBodyBehindAppBar ?? false,
      appBar: withAppBar
          ? AppBar(toolbarHeight: MediaQuery.of(context).size.height * (2 / 15),
            elevation: 0,
            // title: Text('App Bar!'),
            flexibleSpace: withImageInAppBar
                ? Image(
                    image: AssetImage('images/app_bar.png'),
                      fit: BoxFit.cover,
                    )
                : Container(
                    color: Colors.transparent,
                    // fit: BoxFit.cover,
                    // image: AssetImage(''),
                  ),
            leading: withBackButton
                ? IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                : SizedBox(),
            backgroundColor: this.backgroundColor ?? Colors.transparent,
          )
          : null,
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      body: this.pageContent,
    );
  }
}
