class FoodModel {
  FoodModel({
    required this.text,
    required this.parsed,
    required this.hints,
    required this.links,
  });

  String text;
  List<dynamic> parsed;
  List<Hint> hints;
  Links links;

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
    text: json["text"],
    parsed: List<dynamic>.from(json["parsed"].map((x) => x)),
    hints: List<Hint>.from(json["hints"].map((x) => Hint.fromJson(x))),
    links: Links.fromJson(json["_links"]),
  );


}

class Hint {
  Hint({
    required this.food,
    // required this.measures,
  });

  Food food;
  // List<Measure> measures;

  factory Hint.fromJson(Map<String, dynamic> json) => Hint(
    food: Food.fromJson(json["food"]??{}),
    // measures: List<Measure>.from(json["measures"]??[].map((x) => Measure.fromJson(x))),
  );

}

class Food {
  Food({
    required this.foodId,
    required this.label,
    required this.knownAs,
    required this.nutrients,
    required this.category,
    required this.categoryLabel,
    required this.image,
  });

  String foodId;
  String label;
  String knownAs;
  Nutrients nutrients;
  String category;
  String categoryLabel;
  String image;

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    foodId: json["foodId"]??'',
    label: json["label"]??'',
    knownAs: json["knownAs"]??'',
    nutrients: Nutrients.fromJson(json["nutrients"]??{}),
    category: json["category"]??'',
    categoryLabel:json["categoryLabel"]??'',
    image: json["image"]??'https://cdn.pngsumo.com/food-png-illustration-free-food-illustrationpng-transparent-cartoon-food-png-650_650.png',
  );

}

class Nutrients {
  Nutrients({
    required this.enercKcal,
    required this.procnt,
    required this.fat,
    required this.chocdf,
    required this.fibtg,
  });

  num enercKcal;
  num procnt;
  num fat;
  num chocdf;
  num fibtg;

  factory Nutrients.fromJson(Map<String, dynamic> json) => Nutrients(
    enercKcal: json["ENERC_KCAL"],
    procnt: json["PROCNT"]?.toDouble(),
    fat: json["FAT"]?.toDouble(),
    chocdf: json["CHOCDF"]?.toDouble(),
    fibtg: json["FIBTG"]?.toDouble(),
  );

}

class Measure {
  Measure({
    required this.uri,
    required this.label,
    required this.weight,
  });

  String uri;
  String label;
  num weight;

  factory Measure.fromJson(Map<String, dynamic> json) => Measure(
    uri: json["uri"]??'',
    label: json["label"]??'',
    weight: json["weight"]?.toDouble(),
  );

}


class Qualifier {
  Qualifier({
    required this.uri,
    required this.label,
  });

  String uri;
  String label;

  factory Qualifier.fromJson(Map<String, dynamic> json) => Qualifier(
    uri: json["uri"]??'',
    label: json["label"]??'',
  );

}

class Links {
  Links({
    required this.next,
  });

  Next next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    next: Next.fromJson(json["next"]??{}),
  );

}

class Next {
  Next({
    required this.title,
    required this.href,
  });

  String title;
  String href;

  factory Next.fromJson(Map<String, dynamic> json) => Next(
    title: json["title"],
    href: json["href"],
  );

}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
