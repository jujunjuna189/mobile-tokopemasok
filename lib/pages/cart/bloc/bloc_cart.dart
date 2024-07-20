import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tokopemasok/pages/cart/repo/repo.dart';
import 'package:tokopemasok/services/local_storage/local_storage.dart';

class BlocCart extends Cubit<Map<String, dynamic>> {
  BlocCart()
      : super({
          "auth": {},
          "cart": {
            "proccess": "",
            "data": {},
          },
          "user_address": {
            "proccess": "",
            "data": [],
            "controller": {},
          },
        }) {
    onInitialPage();
  }

  void onInitialPage() async {
    await onGetUser().then((value) {
      if (state['auth'] != null) getCart();
    });
  }

  Future onGetUser() async {
    Map<String, dynamic> stateData = {...state};
    await LocalStorage.instance.getSession('user').then((value) {
      stateData['auth'] = value;
      emit(stateData);
    });
  }

  void getCart() async {
    Map<String, dynamic> stateData = {...state};
    await Repo.instance
        .getCart(token: stateData['auth']['token'], include: 'cartProductModel', filter: 'filter[status]=active')
        .then((value) {
      stateData['cart']['proccess'] = value.isEmpty ? "empty" : "done";
      stateData['cart']['data'] = value.isEmpty ? {} : value[0];
      emit(stateData);
    });
  }

  void onAddCart(BuildContext context, {int productId = 0, int productPriceId = 0, double qty = 0}) async {
    Map<String, dynamic> stateData = {...state};
    await Repo.instance.addCart(
      token: stateData['auth']['token'],
      body: {
        'product_id': productId.toString(),
        'product_price_id': productPriceId.toString(),
        'qty': qty.toString(),
      },
    ).then((value) {
      value.isNotEmpty ? stateData['cart']['data'] = value : Navigator.of(context).pop();
      if (value.isNotEmpty) emit(stateData);
    });
  }

  void onUpdateCart(BuildContext context, {String field = '', String value = ''}) async {
    Map<String, dynamic> stateData = {...state};
    await Repo.instance.updateCart(
      token: stateData['auth']['token'],
      body: {
        'id': stateData['cart']['data']['id'].toString(),
        field: value,
      },
    ).then((value) {
      if (value != false) {
        stateData['cart']['data'] = value;
        emit(stateData);
        Navigator.of(context).pop();
      }
    });
  }

  void onAddOrder(BuildContext context) async {
    Map<String, dynamic> stateData = {...state};
    await Repo.instance.addOrder(
      token: stateData['auth']['token'],
      body: {
        'cart_id': stateData['cart']['data']['id'].toString(),
      },
    ).then((value) {
      if (value != false) {
        Navigator.of(context).pop();
      }
    });
  }

  void onChangeUserAddress(String field, String value) {
    Map<String, dynamic> stateData = {...state};
    stateData['user_address']['controller'][field] = value;
    emit(stateData);
  }

  void getUserAddress() async {
    Map<String, dynamic> stateData = {...state};
    await Repo.instance.getUserAddress(token: stateData['auth']['token']).then((value) {
      stateData['user_address']['proccess'] = value.isEmpty ? "empty" : "done";
      stateData['user_address']['data'] = value.isEmpty ? [] : value;
      emit(stateData);
    });
  }

  Future onAddUserAddress() async {
    Map<String, dynamic> stateData = {...state};
    var add = await Repo.instance.addUserAddress(
        token: stateData['auth']['token'],
        body: {'full_address': stateData['user_address']['controller']['full_address']}).then((value) {
      if (value != false) {
        getUserAddress();
        stateData['user_address']['controller'] = {};
        emit(stateData);
      }
      return value;
    });
    return add;
  }

  void onDeleteUserAddress({int id = 0}) async {
    Map<String, dynamic> stateData = {...state};
    await Repo.instance.deleteUserAddress(token: stateData['auth']['token'], body: {'id': id.toString()}).then((value) {
      if (value != false) {
        getUserAddress();
      }
    });
  }

  @override
  void onChange(Change<Map<String, dynamic>> change) {
    super.onChange(change);
    if (change.nextState['loading'] == true) {
      EasyLoading.show();
    } else {
      EasyLoading.dismiss();
    }
  }
}
