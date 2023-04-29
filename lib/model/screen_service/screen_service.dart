class Ingrediants {
  String name;
  int id;
  String timeToPrepare;
  Ingredients ingredients;

  Ingrediants({
    required this.name,
    required this.id,
    required this.timeToPrepare,
    required this.ingredients,
  });

  factory Ingrediants.fromJson(Map<String, dynamic> json) => Ingrediants(
        name: json["name"],
        id: json["id"],
        timeToPrepare: json["timeToPrepare"],
        ingredients: Ingredients.fromJson(json["ingredients"]),
      );
}

class Ingredients {
  List<Spice> vegetables;
  List<Spice> spices;
  List<Appliance> appliances;

  Ingredients({
    required this.vegetables,
    required this.spices,
    required this.appliances,
  });

  factory Ingredients.fromJson(Map<String, dynamic> json) => Ingredients(
        vegetables:
            List<Spice>.from(json["vegetables"].map((x) => Spice.fromJson(x))),
        spices: List<Spice>.from(json["spices"].map((x) => Spice.fromJson(x))),
        appliances: List<Appliance>.from(
            json["appliances"].map((x) => Appliance.fromJson(x))),
      );
}

class Appliance {
  String name;
  String image;

  Appliance({
    required this.name,
    required this.image,
  });

  factory Appliance.fromJson(Map<String, dynamic> json) => Appliance(
        name: json["name"],
        image: json["image"],
      );
}

class Spice {
  String name;
  String quantity;

  Spice({
    required this.name,
    required this.quantity,
  });

  factory Spice.fromJson(Map<String, dynamic> json) => Spice(
        name: json["name"],
        quantity: json["quantity"],
      );
}
