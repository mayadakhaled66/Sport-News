import 'package:flutter/material.dart';
import 'package:sport_news/features/Utilities/ui/app_page.dart';


class MorePage extends StatefulWidget {
  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  BuildContext _dialogContexts,dialogLoadingBuildContext;
  @override
  Widget build(BuildContext context) {
    return AppPage(Container(),withAppBar: true,withImageInAppBar: true,);
  }
}
