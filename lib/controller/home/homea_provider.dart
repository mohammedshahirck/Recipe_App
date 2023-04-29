import 'package:chefskart/model/choice/choice_model.dart';
import 'package:chefskart/model/home/home_model.dart';
import 'package:chefskart/services/home/home_service.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    getDishes();
  }
  List<Recipe> recipe = [];
  Recipe? dish;

  bool isLoading = false;
  List<Choice> choice = [
    Choice(name: 'Italian'),
    Choice(name: 'Indian'),
    Choice(name: 'Indian'),
    Choice(name: 'Labanis'),
  ];

  List<Choice> get choices => choice;

  void selectChoice(Choice choice) {
    for (var c in choices) {
      c.isSelected = c == choice;
    }
    notifyListeners();
  }

  Future<void> getDishes() async {
    isLoading = true;
    notifyListeners();
    await RecipeService().getDishes().then(
      ((value) {
        if (value != null) {
          recipe = value;
          notifyListeners();
          isLoading = false;
        } else {
          isLoading = false;
          notifyListeners();
        }
      }),
    );
  }
}
