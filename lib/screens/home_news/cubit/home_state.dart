part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}



class ChangeNavBar extends HomeState {}




class GetDataBusinessLoading extends HomeState {}
class GetDataBusinessSuccess extends HomeState {}
class GetDataBusinessFilder extends HomeState {}

class GetDataSportsLoading extends HomeState {}
class GetDataSportsSuccess extends HomeState {}
class GetDataSportsFilder extends HomeState {}



class GetDataSciencesLoading extends HomeState {}
class GetDataSciencesSuccess extends HomeState {}
class GetDataSciencesFilder extends HomeState {}

