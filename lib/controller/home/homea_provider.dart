import 'package:chefskart/model/choice/choice_model.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
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
}
