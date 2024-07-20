import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tokopemasok/pages/order/repo/repo.dart';
import 'package:tokopemasok/services/local_storage/local_storage.dart';

class BlocOrder extends Cubit<Map<String, dynamic>> {
  BlocOrder({String? arguments})
      : super({
          "arguments": jsonDecode(arguments ?? '') as Map<String, dynamic>,
          "auth": {},
          "order": {
            "proccess": "",
            "data": {},
          },
        }) {
    onInitialPage();
  }

  void onInitialPage() async {
    await onGetUser().then((value) {
      getOrder();
    });
  }

  Future onGetUser() async {
    Map<String, dynamic> stateData = {...state};
    await LocalStorage.instance.getSession('user').then((value) {
      stateData['auth'] = value;
      emit(stateData);
    });
  }

  void getOrder() async {
    Map<String, dynamic> stateData = {...state};
    await Repo.instance
        .getOrder(
            token: stateData['auth']['token'],
            include: 'orderStatusModel,orderProductModel',
            filter: 'filter[id]=${state['arguments']?['id'].toString() ?? '0'}')
        .then((value) {
      stateData['order']['proccess'] = value.isEmpty ? "empty" : "done";
      stateData['order']['data'] = value.isEmpty ? {} : value[0];
      emit(stateData);
    });
  }

  void onAddOrderStatus() async {
    Map<String, dynamic> stateData = {...state};
    await Repo.instance.addOrderStatus(
      token: stateData['auth']['token'],
      body: {
        'order_number': stateData['order']['data']['order_number'],
        'status': "request_cancelled",
        'description': "Meminta pesanan dibatalkan. Pesanan akan dibatalkan jika permintaan disetujui",
      },
    ).then((value) {
      if (value != false) {
        getOrder();
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
