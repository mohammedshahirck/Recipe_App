import 'dart:developer';

import 'package:chefskart/model/screen_service/screen_service.dart';
import 'package:dio/dio.dart';

class ScreenService {
  final Dio dio = Dio();
  final String baseUrl =
      'https://8b648f3c-b624-4ceb-9e7b-8028b7df0ad0.mock.pstmn.io/dishes/v1/1';
  Future<List<Ingrediants>?> getInGrediants() async {
    try {
      final response = await dio.get(baseUrl);
      if (response.statusCode == 200) {
        log(response.data.toString());
        // final ingrediants = Ingredients.fromJson(response.data);
        final ingrediants = (response.data as List)
            .map((e) => Ingrediants.fromJson(e))
            .toList();
        return ingrediants;
      }
    } on DioError catch (e) {
      log(e.toString());
    }
    return null;
  }
}
