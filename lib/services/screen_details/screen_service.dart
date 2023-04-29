import 'dart:developer';

import 'package:chefskart/model/screen_service/screen_service.dart';
import 'package:dio/dio.dart';

class ScreenService {
  final Dio dio = Dio();
  final String baseUrl =
      'https://8b648f3c-b624-4ceb-9e7b-8028b7df0ad0.mock.pstmn.io/dishes/v1/';
  Future<Ingrediants?> getInGrediants() async {
    try {
      final response = await dio.get(baseUrl);
      if (response.statusCode == 200) {
        log(response.data.toString());
        final model = Ingrediants.fromJson(response.data);
        return model;
      }
    } on DioError catch (e) {
      log(e.toString());
    }
    return null;
  }
}
