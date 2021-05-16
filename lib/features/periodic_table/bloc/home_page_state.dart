part of 'home_page_bloc.dart';

class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object> get props => [];
}
class HomePageInitial extends HomePageState {
  @override
  List<Object> get props => [];
}
class HomePageLoading extends HomePageState {
  @override
  List<Object> get props => [];
}
class UserDataHomePageSuccessState extends HomePageState {
  PeriodicTableModel userInfo;
  UserDataHomePageSuccessState(this.userInfo);
  @override
  List<Object> get props => [this.userInfo];
}
class HomePageFail extends HomePageState {
  final String error;
  HomePageFail({this.error});
  @override
  List<Object> get props => [this.error];
}