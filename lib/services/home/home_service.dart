import 'dart:convert';
import 'package:chefskart/model/home/home_model.dart';
import 'package:chefskart/utils/exceptions/exceptions.dart';
import 'package:dio/dio.dart';

class RecipeService {
  final Dio dio = Dio();
  final String baseUrl =
      'https://8b648f3c-b624-4ceb-9e7b-8028b7df0ad0.mock.pstmn.io/dishes/v1/';
  Future<List<Dish>?> getDishes() async {
    try {
      final response = await dio.get(baseUrl);
      if (response.statusCode == 200) {
        final result = json.decode(response.data);
        Iterable list = result["dishes"];
        final model = list.map((e) => Dish.fromJson(e)).toList();
        return model;
      }
    } on DioError catch (e) {
      Exceptions.errorHandler(e);
    }
    return null;
  }

  Future<List<PopularDish>?> getPopularDishes() async {
    try {
      final response = await dio.get(baseUrl);
      if (response.statusCode == 200) {
        final result = json.decode(response.data);
        Iterable list = result["popularDishes"];
        final model = list.map((e) => PopularDish.fromJson(e)).toList();
        return model;
      }
    } on DioError catch (e) {
      Exceptions.errorHandler(e);
    }
    return null;
  }
}
