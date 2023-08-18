import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:simpsons_character_viewer/infrastructure/environment/environment.dart';
import 'package:simpsons_character_viewer/infrastructure/models/response_model.dart';

class DataRepository {
  Future<ResponseModel> fetchData() async {
    try {
      String url =
          '${Environment.instance.baseApi.baseUrl}${Environment.instance.baseApi.characterUrl}';
      final result = await http.get(Uri.parse(url));
      return ResponseModel().success(data: jsonDecode(result.body));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return ResponseModel.error(error: e);
    }
  }
}
