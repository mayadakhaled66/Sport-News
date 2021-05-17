import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/Utilities/localization/localization.dart';
import 'features/Utilities/localization/translation.dart';
import 'features/app_controller/view/HomePageController.dart';
import 'features/periodic_table/bloc/home_page_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePagesState createState() => _MyHomePagesState();
  final String title;

  static void setLocale(BuildContext context, Locale newLocale) async {
    _MyHomePagesState state =
        context.findAncestorStateOfType<_MyHomePagesState>();
    await state.setLocale(newLocale);
  }
}

class _MyHomePagesState extends State<MyHomePage> {
  Locale _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (this._locale == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[800])),
        ),
      );
    } else {
      return MultiBlocProvider(
        providers: [
          BlocProvider<HomePageBloc>(
            create: (BuildContext context) => HomePageBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sport News',
          home: HomePageController(),
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primarySwatch: Colors.amber,
            primaryColor: Color(0xFF0F1737),
            accentColor: Colors.white,
            tabBarTheme: TabBarTheme(labelColor: Colors.white),
            textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                  color: Colors.black,
                ),
                body2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                title: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
          ),
          routes: {
            "/welcomePage": (context) => HomePageController(),
          },
          localizationsDelegates: [
            Localization.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [Locale("en", "US"), Locale('ar', 'SA')],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale.languageCode &&
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          locale: _locale,
          // locale: Locale("en", "US")
        ),
      );
    }
  }

  @override
  void initState() {}
}
