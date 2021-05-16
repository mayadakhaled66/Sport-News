import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/app_controller/view/HomePageController.dart';
import 'features/periodic_table/bloc/home_page_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  // runApp(BlocProvider<AuthenticationBloc>(
  //     create: (_) => AuthenticationBloc(userRepository: UserRepository()),
  //     child: MyApp()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePagesState createState() => _MyHomePagesState();
}

class _MyHomePagesState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider<LoginBloc>(
        //   create: (BuildContext context) => LoginBloc(),
        // ),
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
          // "/loginPage": (context) => LoginMainPage(),
        },
          localizationsDelegates: [
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            Locale("en", "US"),
            Locale('ar', 'AE')
          ],
          locale: Locale('ar', 'AE')
      ),
    );
  }

  @override
  void initState() {
    // SchedulerBinding.instance.addPostFrameCallback((_) {
    // BlocProvider.of<AuthenticationBloc>(context).add(AppStarted());
    // });


  }
}
