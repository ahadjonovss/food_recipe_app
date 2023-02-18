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

  Map<String, dynamic> toJson() => {
    "text": text,
    "parsed": List<dynamic>.from(parsed.map((x) => x)),
    "hints": List<dynamic>.from(hints.map((x) => x.toJson())),
    "_links": links.toJson(),
  };
}

class Hint {
  Hint({
    required this.food,
    required this.measures,
  });

  Food food;
  List<Measure> measures;

  factory Hint.fromJson(Map<String, dynamic> json) => Hint(
    food: Food.fromJson(json["food"]),
    measures: List<Measure>.from(json["measures"].map((x) => Measure.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "food": food.toJson(),
    "measures": List<dynamic>.from(measures.map((x) => x.toJson())),
  };
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
  Category category;
  CategoryLabel categoryLabel;
  String image;

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    foodId: json["foodId"],
    label: json["label"],
    knownAs: json["knownAs"],
    nutrients: Nutrients.fromJson(json["nutrients"]),
    category: categoryValues.map[json["category"]]!,
    categoryLabel: categoryLabelValues.map[json["categoryLabel"]]!,
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "foodId": foodId,
    "label": label,
    "knownAs": knownAs,
    "nutrients": nutrients.toJson(),
    "category": categoryValues.reverse[category],
    "categoryLabel": categoryLabelValues.reverse[categoryLabel],
    "image": image,
  };
}

enum Category { GENERIC_FOODS }

final categoryValues = EnumValues({
  "Generic foods": Category.GENERIC_FOODS
});

enum CategoryLabel { FOOD }

final categoryLabelValues = EnumValues({
  "food": CategoryLabel.FOOD
});

class Nutrients {
  Nutrients({
    required this.enercKcal,
    required this.procnt,
    required this.fat,
    required this.chocdf,
    required this.fibtg,
  });

  int enercKcal;
  double procnt;
  double fat;
  double chocdf;
  double fibtg;

  factory Nutrients.fromJson(Map<String, dynamic> json) => Nutrients(
    enercKcal: json["ENERC_KCAL"],
    procnt: json["PROCNT"]?.toDouble(),
    fat: json["FAT"]?.toDouble(),
    chocdf: json["CHOCDF"]?.toDouble(),
    fibtg: json["FIBTG"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "ENERC_KCAL": enercKcal,
    "PROCNT": procnt,
    "FAT": fat,
    "CHOCDF": chocdf,
    "FIBTG": fibtg,
  };
}

class Measure {
  Measure({
    required this.uri,
    required this.label,
    required this.weight,
    required this.qualified,
  });

  String uri;
  String label;
  double weight;
  List<Qualified> qualified;

  factory Measure.fromJson(Map<String, dynamic> json) => Measure(
    uri: json["uri"],
    label: json["label"],
    weight: json["weight"]?.toDouble(),
    qualified: List<Qualified>.from(json["qualified"].map((x) => Qualified.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "label": label,
    "weight": weight,
    "qualified": List<dynamic>.from(qualified.map((x) => x.toJson())),
  };
}

class Qualified {
  Qualified({
    required this.qualifiers,
    required this.weight,
  });

  List<Qualifier> qualifiers;
  int weight;

  factory Qualified.fromJson(Map<String, dynamic> json) => Qualified(
    qualifiers: List<Qualifier>.from(json["qualifiers"].map((x) => Qualifier.fromJson(x))),
    weight: json["weight"],
  );

  Map<String, dynamic> toJson() => {
    "qualifiers": List<dynamic>.from(qualifiers.map((x) => x.toJson())),
    "weight": weight,
  };
}

class Qualifier {
  Qualifier({
    required this.uri,
    required this.label,
  });

  String uri;
  String label;

  factory Qualifier.fromJson(Map<String, dynamic> json) => Qualifier(
    uri: json["uri"],
    label: json["label"],
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "label": label,
  };
}

class Links {
  Links({
    required this.next,
  });

  Next next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    next: Next.fromJson(json["next"]),
  );

  Map<String, dynamic> toJson() => {
    "next": next.toJson(),
  };
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

  Map<String, dynamic> toJson() => {
    "title": title,
    "href": href,
  };
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
