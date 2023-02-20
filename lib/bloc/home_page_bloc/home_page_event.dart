part of 'home_page_bloc.dart';

@immutable
abstract class HomePageEvent {}


class GetDefaultMeals extends HomePageEvent{
}

class SearchMealsEvent extends HomePageEvent{
  String name;

  SearchMealsEvent({required this.name});
}
