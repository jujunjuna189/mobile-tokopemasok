import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tokopemasok/pages/auth/repo/repo.dart';
import 'package:tokopemasok/routes/route_name.dart';
import 'package:tokopemasok/services/local_storage/local_storage.dart';

class BlocLogin extends Cubit<Map<String, dynamic>> {
  BlocLogin()
      : super({
          "auth": {
            'username': "",
            "password": "",
          }
        });

  void onChangeAuth(String field, String value) {
    Map<String, dynamic> data = state['auth'] as Map<String, dynamic>;

    data[field] = value;

    emit({
      "auth": data,
    });
  }

  void onLogin(BuildContext context) async {
    Map<String, dynamic> dataBatch = state['auth'] as Map<String, dynamic>;
    emit({...state, "loading": true});
    try {
      await Repo.instance.login(body: dataBatch).then((value) async {
        emit({...state, "loading": false});
        if (value != false) {
          await LocalStorage.instance.setSession('user', value).then((value) {
            Navigator.of(context).pushNamedAndRemoveUntil(RouteName.BOARD, ((route) => false));
          });
        }
      });
    } catch (e) {
      emit({...state, "loading": false});
    }
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
