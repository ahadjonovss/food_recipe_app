class FoodDetailedModel {
  String name;
  String category;
  String nationality;
  String instruction;
  String image;
  String source;

  FoodDetailedModel(
      {required this.category,
      required this.image,
      required this.name,
      required this.instruction,
      required this.nationality,
      required this.source});

  factory FoodDetailedModel.fromJson(Map<String, dynamic> json) {
    return FoodDetailedModel(
      category: json["strCategory"]??'',
      image: json["strMealThumb"]??"",
      name: json["strMeal"]??"",
      instruction: json["strInstructions"]??"",
      nationality: json["strArea"]??"",
      source: json["strYoutube"]??"",
    );
  }
}

