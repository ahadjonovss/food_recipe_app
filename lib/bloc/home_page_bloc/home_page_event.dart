part of 'home_page_bloc.dart';

@immutable
abstract class HomePageEvent {}


class GetDefaultMeals extends HomePageEvent{
}

class SearchMealsEvent extends HomePageEvent{
  String name;

  SearchMealsEvent({required this.name});
}


class AddNutrientEvent extends HomePageEvent{
  String nutrient;

  AddNutrientEvent({required this.nutrient});
}

class SearchBySelectedEvent extends HomePageEvent{}