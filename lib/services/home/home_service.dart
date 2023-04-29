import 'dart:developer';
import 'package:chefskart/model/home/home_model.dart';
import 'package:dio/dio.dart';

class RecipeService {
  final Dio dio = Dio();
  final String baseUrl =
      'https://8b648f3c-b624-4ceb-9e7b-8028b7df0ad0.mock.pstmn.io/dishes/v1/';
  Future<dynamic> getDishes() async {
    try {
      final response = await dio.get(baseUrl);
      if (response.statusCode == 200) {
        log(response.data);
        // final List dish = response.data["dishes"];
        final dishes = Recipe.fromJson(response.data);
        // (response.data as List).map((e) => Recipe.fromJson(e)).toList();
        return dishes;
      }
    } on DioError catch (e) {
      // Exceptions.errorHandler(e);
      log(e.toString());
    }
    return null;
  }
}
