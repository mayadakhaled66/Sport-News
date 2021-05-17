import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sport_news/features/periodic_table/model/PeriodicTableModel.dart';
import 'package:sport_news/features/periodic_table/model/PeriodicTableRepo.dart';

part 'home_page_event.dart';

part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  PeriodicTableRepo homeRepo = PeriodicTableRepo();

  HomePageBloc() : super(PeriodicTableHomePageInitial());

  @override
  Stream<HomePageState> mapEventToState(
    HomePageEvent event,
  ) async* {
    if (event is UserDataHomePageEvent) {
      try {
        yield PeriodicTableHomePageLoading();
        PeriodicTableModel userModel = await homeRepo.getUsers();
        if (userModel != null) {
          yield PeriodicTableDataHomePageSuccessState(userModel);
        } else {
          yield PeriodicTableHomePageFail(error: "no active users");
        }
      } catch (error) {
        yield PeriodicTableHomePageFail(error: error.toString());
      }
    }
  }
}
