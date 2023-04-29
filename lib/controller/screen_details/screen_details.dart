import 'package:chefskart/model/screen_service/screen_service.dart';
import 'package:chefskart/services/screen_details/screen_service.dart';
import 'package:flutter/material.dart';

class ScreenProvider with ChangeNotifier {
  bool isLoading = false;
  Ingrediants? ingrediants;

  void getIngrediant() async {
    isLoading = true;
    notifyListeners();
    await ScreenService().getInGrediants().then((value) {
      if (value != null) {
        ingrediants = value;
        notifyListeners();
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
      }
    });
  }
}
