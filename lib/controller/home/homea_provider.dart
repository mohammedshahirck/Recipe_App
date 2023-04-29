import 'package:chefskart/model/choice/choice_model.dart';
import 'package:chefskart/model/home/home_model.dart';
import 'package:chefskart/services/home/home_service.dart';
import 'package:chefskart/view/home/selected_dishes.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  HomeProvider() {
    loaddata();
  }

  loaddata() {
    getDishes();
    getPopularDishes();

    notifyListeners();
  }

  List<Dish> recipe = [];
  List<PopularDish> populardishes = [];
  Dish? dish;

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

  void getPopularDishes() async {
    isLoading = true;
    notifyListeners();
    await RecipeService().getPopularDishes().then(
      ((value) {
        if (value != null) {
          notifyListeners();
          populardishes = value;
          notifyListeners();
          isLoading = false;
          notifyListeners();
        } else {
          isLoading = false;
          notifyListeners();
          return null;
        }
      }),
    );
  }

  void getDishes() async {
    isLoading = true;
    notifyListeners();
    await RecipeService().getDishes().then(
      ((value) {
        if (value != null) {
          notifyListeners();
          recipe = value;
          notifyListeners();
          isLoading = false;
          notifyListeners();
        } else {
          isLoading = false;
          notifyListeners();
          return null;
        }
      }),
    );
  }

  void splash(context) async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const SelectDishes(),
        ),
        (route) => false);
  }
}
