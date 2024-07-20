import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:tokopemasok/utils/api/api.dart';

class Repo {
  Repo._privateContructor();
  static final Repo instance = Repo._privateContructor();

  // Product
  Future<List> getProduct({String filter = ''}) async {
    try {
      final response = await http.get(Uri.parse("${Api.product}?include=price&$filter"));
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse['data']['product']['data'];
      } else {
        var jsonResponse = jsonDecode(response.body);
        EasyLoading.showToast(jsonResponse['message']);
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  // Cart
  Future<List> getCart({String token = '', String filter = ''}) async {
    try {
      final response = await http.get(Uri.parse("${Api.cart}?$filter"), headers: {
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse['data']['cart']['data'];
      } else {
        var jsonResponse = jsonDecode(response.body);
        EasyLoading.showToast(jsonResponse['message']);
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<Map> addCart({String token = '', Map<String, dynamic> body = const {}}) async {
    try {
      final response = await http.post(
        Uri.parse("${Api.cart}/create"),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: body,
      );
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse['data']['cart'];
      } else {
        var jsonResponse = jsonDecode(response.body);
        EasyLoading.showToast(jsonResponse['message']);
        return {};
      }
    } catch (e) {
      return {};
    }
  }

  // Order
  Future<List> getOrder({String token = '', String filter = '', String sort = '', String include = ''}) async {
    try {
      final response = await http.get(Uri.parse("${Api.order}?$filter&$sort&$include"), headers: {
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
}
