part of 'home_page_bloc.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}



//Get Meals

class GettingMealsInProgressState extends HomePageState{}
class GettingMealsInSuccessState extends HomePageState{}
class GettingMealsInFailuryState extends HomePageState{}
