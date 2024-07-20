import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:tokopemasok/utils/api/api.dart';

class Repo {
  Repo._privateContructor();
  static final Repo instance = Repo._privateContructor();

  Future<dynamic> login({body = Map<String, dynamic>}) async {
    try {
      final response = await http.post(Uri.parse(Api.login), body: body);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse['data'];
      } else if (response.statusCode == 400) {
        var jsonResponse = jsonDecode(response.body);
        Iterable<String> keys = jsonResponse['message'].keys;
        EasyLoading.showToast(jsonResponse['message'][keys.first][0]);
        return false;
      } else {
        var jsonResponse = jsonDecode(response.body);
        EasyLoading.showToast(jsonResponse['message']);
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future register({body = Map<String, dynamic>}) async {
    try {
      final response = await http.post(Uri.parse(Api.register), body: body);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
