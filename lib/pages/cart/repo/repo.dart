import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:tokopemasok/utils/api/api.dart';

class Repo {
  Repo._privateContructor();
  static final Repo instance = Repo._privateContructor();

  // Cart
  Future<List> getCart({String token = '', String include = '', String filter = ''}) async {
    try {
      final response = await http.get(Uri.parse("${Api.cart}?include=$include&$filter"), headers: {
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

  Future updateCart({String token = '', Map<String, dynamic> body = const {}}) async {
    try {
      final response = await http.post(
        Uri.parse("${Api.cart}/update"),
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
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  // Order
  Future addOrder({String token = '', Map<String, dynamic> body = const {}}) async {
    try {
      final response = await http.post(
        Uri.parse("${Api.order}/create"),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: body,
      );
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse['data']['order'];
      } else {
        var jsonResponse = jsonDecode(response.body);
        EasyLoading.showToast(jsonResponse['message']);
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  // User address
  Future<List> getUserAddress({String token = '', String include = '', String filter = ''}) async {
    try {
      final response = await http.get(Uri.parse("${Api.userAddress}?include=$include&$filter"), headers: {
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse['data']['user_address']['data'];
      } else {
        var jsonResponse = jsonDecode(response.body);
        EasyLoading.showToast(jsonResponse['message']);
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future addUserAddress({String token = '', Map<String, dynamic> body = const {}}) async {
    try {
      final response = await http.post(
        Uri.parse("${Api.userAddress}/create"),
        body: body,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse['data']['user_address'];
      } else {
        var jsonResponse = jsonDecode(response.body);
        EasyLoading.showToast(jsonResponse['message']);
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future deleteUserAddress({String token = '', Map<String, dynamic> body = const {}}) async {
    try {
      final response = await http.post(
        Uri.parse("${Api.userAddress}/delete"),
        body: body,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse['data']['user_address'];
      } else {
        var jsonResponse = jsonDecode(response.body);
        EasyLoading.showToast(jsonResponse['message']);
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
