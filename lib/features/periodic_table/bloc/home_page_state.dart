part of 'home_page_bloc.dart';

class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object> get props => [];
}
class PeriodicTableHomePageInitial extends HomePageState {
  @override
  List<Object> get props => [];
}
class PeriodicTableHomePageLoading extends HomePageState {
  @override
  List<Object> get props => [];
}
class PeriodicTableDataHomePageSuccessState extends HomePageState {
  PeriodicTableModel periodicTableModel;
  PeriodicTableDataHomePageSuccessState(this.periodicTableModel);
  @override
  List<Object> get props => [this.periodicTableModel];
}
class PeriodicTableHomePageFail extends HomePageState {
  final String error;
  PeriodicTableHomePageFail({this.error});
  @override
  List<Object> get props => [this.error];
}