import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_news/features/Utilities/ui/ErrorDialog.dart';
import 'package:sport_news/features/Utilities/ui/LoadingIndecator.dart';
import 'package:sport_news/features/Utilities/ui/app_page.dart';
import 'package:sport_news/features/periodic_table/bloc/home_page_bloc.dart';
import 'package:sport_news/features/periodic_table/model/PeriodicTableModel.dart';

class PeriodicPage extends StatefulWidget {
  const PeriodicPage({Key key}) : super(key: key);

  @override
  _PeriodicPageState createState() => _PeriodicPageState();
}

class _PeriodicPageState extends State<PeriodicPage> {
  PeriodicTableModel _periodicTableModel;
  BuildContext _dialogContexts;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        return BlocListener<HomePageBloc, HomePageState>(
            listener: (context, state) {
              if (state is PeriodicTableHomePageLoading) {
                return showDialog<void>(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext dialogContext) {
                    _dialogContexts = dialogContext;
                    return LoadingProgressDialog();
                  },
                );
              } else if (state is PeriodicTableHomePageFail) {
                if (_dialogContexts != null) {
                  Navigator.pop(_dialogContexts);
                  _dialogContexts = null;
                }
                return showDialog<void>(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext dialogContext) {
                    return ErrorDialog(
                      state.error,
                      context,
                    );
                  },
                );
              } else if (state is PeriodicTableDataHomePageSuccessState) {
                if (_dialogContexts != null) {
                  Navigator.pop(_dialogContexts);
                  _dialogContexts = null;
                }
                if (state.periodicTableModel != null) {
                  _periodicTableModel = state.periodicTableModel;
                } else {
                  _periodicTableModel = PeriodicTableModel();
                }
              }
            },
            child: AppPage(
              _periodicTableModel != null
                  ? buildUsersWidget(_periodicTableModel)
                  : buildNoDataWidget(),
              withAppBar: true,
              withImageInAppBar: true,
            ));
      },
    );
  }

  buildNoDataWidget() {
    return Center(
      child: Text(
        "No Data",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  buildUsersWidget(PeriodicTableModel periodicTableObject) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [...renderUserList(periodicTableObject)],
      ),
    );
  }

  List<Widget> renderUserList(PeriodicTableModel periodicTableObject) {
    List<Widget> listOfTeamWidget = [];
    periodicTableObject.data.forEach((element) {
      listOfTeamWidget.add(Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: MediaQuery.of(context).size.height * (3 / 15),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0),
              spreadRadius: -5, //(x,y)
              blurRadius: 10.0,
            )
          ]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    element.avatar,
                  ),
                  radius: 50,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${element.firstName} ${element.lastName}",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    Text(element.email),
                    Text("${element.id.toString()}"),
                  ],
                ),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   mainAxisSize: MainAxisSize.min,
                //   children: [
                //     Text(
                //       element.team2Name,
                //       style: TextStyle(
                //           color: Colors.black, fontWeight: FontWeight.w600),
                //     ),
                //     Image.asset(
                //       element.imagePath,
                //       height: 50,
                //       width: 50,
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ));
    });
    return listOfTeamWidget;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomePageBloc>(context).add(UserDataHomePageEvent());
    });
  }
}
