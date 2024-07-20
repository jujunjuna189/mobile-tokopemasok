import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:tokopemasok/utils/api/api.dart';

class Repo {
  Repo._privateContructor();
  static final Repo instance = Repo._privateContructor();

  // order
  Future<List> getOrder({String token = '', String include = '', String filter = ''}) async {
    try {
      final response = await http.get(Uri.parse("${Api.order}?include=$include&$filter"), headers: {
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse['data']['order']['data'];
      } else {
        var jsonResponse = jsonDecode(response.body);
        EasyLoading.showToast(jsonResponse['message']);
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  // order status
  Future addOrderStatus({String token = '', Map<String, dynamic> body = const {}}) async {
    try {
      final response = await http.post(
        Uri.parse("${Api.orderStatus}/create"),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: body,
      );
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse['data']['order_status'];
      } else {
        var jsonResponse = jsonDecode(response.body);
        EasyLoading.showToast(jsonResponse['message']);
        return false;
      }
    } catch (e) {
      EasyLoading.showToast(e.toString());
      return false;
    }
  }
}
