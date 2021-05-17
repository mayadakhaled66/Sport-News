import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_news/features/Utilities/ui/app_page.dart';

class MorePage extends StatefulWidget {
  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  BuildContext _dialogContexts, dialogLoadingBuildContext;
  bool _switchValue=true;
  @override
  Widget build(BuildContext context) {
    return AppPage(
      buildMorePageContent(),
      withAppBar: false,
      withImageInAppBar: false,
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  buildMorePageContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0).copyWith(top: 50, bottom: 50),
              child: Image.asset(
                "images/5TRrpRAGc@3x.png",
                width: MediaQuery.of(context).size.width * (1 / 6),
              ),
            ),
            buildTextWidget("دليل النوادي"),
            buildTextWidget("دليل الملاعب"),
            buildTextWidget("من نحن"),
            buildTextWidget("الأنظمة واللوائح"),
            buildTextWidget("اللجان"),
            buildTextWidget("اتصل بنا"),
            buildTextWidget("شارك التطبيق"),
            buildTextWidget("الاشتراك بالنشرة الاخبارية"),
            Row(
              children: [
                buildTextWidget(_switchValue?"العربيه":"English"),
                CupertinoSwitch(
                  value: _switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            buildSocialIconsWidget("Icon@3x.png"),
            buildSocialIconsWidget("Icon2@3x.png"),
            buildSocialIconsWidget("Icon3@3x.png"),
            buildSocialIconsWidget("Icon5@3x.png"),
            buildSocialIconsWidget("Icon6@3x.png"),
          ],
        ),
      ],
    );
  }

  buildTextWidget(String text) {
    return Padding(
      padding: const EdgeInsets.all(10.0).copyWith(right: 25),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
      ),
    );
  }

  buildSocialIconsWidget(String imageName) {
    return Padding(
      padding: const EdgeInsets.all(10.0).copyWith(left: 25, bottom: 20),
      child: Image.asset(
        "images/$imageName",
        width: 20,
        height: 20,
      ),
    );
  }
}
