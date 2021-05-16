import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sport_news/features/periodic_table/model/PeriodicTableModel.dart';
import 'package:sport_news/features/periodic_table/model/PeriodicTableRepo.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {

  PeriodicTableRepo homeRepo = PeriodicTableRepo();
  HomePageBloc() : super(HomePageInitial());

  @override
  Stream<HomePageState> mapEventToState(
    HomePageEvent event,
  ) async* {
    if (event is UserDataHomePageEvent) {
      try {
        yield HomePageLoading();
        PeriodicTableModel userModel = await homeRepo.getUsers();
        if(userModel!=null){
          yield UserDataHomePageSuccessState(userModel);
        }else{
          yield HomePageFail(error: "no active users");
        }

      } catch (error) {
        yield HomePageFail(error: error.toString());
      }
    }
    // else if(event is TagDataHomePageEvent){
    //   try {
    //     yield HomePageLoading();
    //     TagModel tagModel = await homeRepo.getTags();
    //     if(tagModel!=null){
    //       yield TagDataHomePageSuccessState(tagModel);
    //     }else{
    //       yield HomePageFail(error: "no tags");
    //     }
    //
    //   } catch (error) {
    //     yield HomePageFail(error: error.toString());
    //   }
    // }else if(event is PostDataPageEvent){
    //   try {
    //     yield HomePageLoading();
    //     PostModel postModel = await homeRepo.getPosts();
    //     if(postModel!=null){
    //       yield PostDataHomePageSuccessState(postModel);
    //     }else{
    //       yield HomePageFail(error: "no posts");
    //     }
    //
    //   } catch (error) {
    //     yield HomePageFail(error: error.toString());
    //   }
    // }
    // else if(event is PostDataByUserIdPageEvent){
    //   try {
    //     yield HomePageLoading();
    //     PostModel postModel = await homeRepo.getPostsPerUserId(userId: event.userId);
    //     if(postModel!=null){
    //       yield PostDataByUserIDHomePageSuccessState(postModel);
    //     }else{
    //       yield HomePageFail(error: "no posts");
    //     }
    //
    //   } catch (error) {
    //     yield HomePageFail(error: error.toString());
    //   }
    // }
  }
}
