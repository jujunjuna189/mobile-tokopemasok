import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sizer/sizer.dart';
import 'package:tokopemasok/pages/board/repo/repo.dart';
import 'package:tokopemasok/pages/board/screen/Tab.dart';
import 'package:tokopemasok/pages/board/screen/content/home.dart';
import 'package:tokopemasok/pages/board/screen/content/order.dart';
import 'package:tokopemasok/pages/board/screen/content/profile.dart';
import 'package:tokopemasok/routes/route_name.dart';
import 'package:tokopemasok/services/local_storage/local_storage.dart';

class BlocBoard extends Cubit<Map<String, dynamic>> {
  BlocBoard()
      : super({
          "bottom_navigation_current": {
            "key": 0,
            "image": "assets/icon/home.svg",
            "title": "Beranda",
            "auth": false,
            "top_navigation": const WidgetTab(),
            "tab": [
              {
                "title": "Tokopemasok",
                "is_active": true,
              },
            ],
            "content": const Home(),
            "is_active": true,
          },
          "bottom_navigation": [
            {
              "key": 0,
              "image": "assets/icon/home.svg",
              "title": "Beranda",
              "auth": false,
              "top_navigation": const WidgetTab(),
              "tab": [
                {
                  "title": "Tokopemasok",
                  "is_active": true,
                },
              ],
              "content": const Home(),
              "is_active": true,
            },
            {
              "key": 1,
              "image": "assets/icon/shopping-cart.svg",
              "title": null,
              "auth": true,
              "top_navigation": null,
              "content": null,
              "design": 'circle',
              "on_press": ((context, blocBoard) =>
                  Navigator.pushNamed(context, RouteName.CART).whenComplete(() => blocBoard.getCartHome())),
              "is_active": false,
            },
            {
              "key": 2,
              "image": "assets/icon/order-list.svg",
              "title": "Pesanan",
              "auth": true,
              "top_navigation": Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.5),
                child: Text(
                  "Pesanan",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 11.8.sp),
                ),
              ),
              "content": const Order(),
              "is_active": false,
            },
            {
              "key": 3,
              "image": "assets/icon/user-circle.svg",
              "title": "Biodata",
              "auth": true,
              "top_navigation": Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.5),
                child: Text(
                  "Biodata",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 11.8.sp),
                ),
              ),
              "content": const Profile(),
              "is_active": false,
            }
          ],
          // General state
          "auth": {},
          // Home state
          "home": {
            "menu_scroll_position": 0.0,
            "cart": {
              "proccess": "",
              "data": {},
            },
            "product": {
              "proccess": "",
              "data": [],
            },
            "product_current": {
              "proccess": "",
              "data": {},
            },
          },
          // Order State
          "order": {
            "tab_current": {},
            "tab": [
              {
                "key": 0,
                "key_data": "done",
                "title": "Riwayat",
                "is_active": true,
              },
              {
                "key": 1,
                "key_data": "processed",
                "title": "Diproses",
                "is_active": false,
              },
              {
                "key": 2,
                "key_data": "scheduled",
                "title": "Dijadwalkan",
                "is_active": false,
              },
            ],
            "done": {
              "proccess": "",
              "data": [],
            },
            "processed": {
              "proccess": "",
              "data": [],
            },
            "scheduled": {
              "proccess": "",
              "data": [],
            },
          },
        }) {
    onInitialPage(0);
  }

  void onChangeTab(int index) {
    Map<String, dynamic> stateData = {...state};
    List<dynamic> bottomNavigation = stateData['bottom_navigation_current']['tab'] as List<dynamic>;

    bottomNavigation.asMap().forEach((indexChild, item) {
      stateData['bottom_navigation_current']['tab'][indexChild]['is_active'] = false;
    });

    stateData['bottom_navigation_current']['tab'][index]['is_active'] = true;
    emit(stateData);
  }

  void onChangeBottomNavigation(int index) {
    Map<String, dynamic> stateData = {...state};
    List<dynamic> bottomNavigation = stateData['bottom_navigation'] as List<dynamic>;

    bottomNavigation.asMap().forEach((indexChild, item) {
      stateData['bottom_navigation'][indexChild]['is_active'] = false;
    });

    stateData['bottom_navigation_current'] = stateData['bottom_navigation'][index];
    stateData['bottom_navigation'][index]['is_active'] = true;
    emit(stateData);
    onInitialPage(stateData['bottom_navigation'][index]['key']);
  }

  void onInitialPage(int key) async {
    await onGetUser().then((value) {
      switch (key) {
        case 0:
          onInitialPageHome();
          break;
        case 2:
          onInitialPageOrder();
          break;
      }
    });
  }

  Future onGetUser() async {
    Map<String, dynamic> stateData = {...state};
    await LocalStorage.instance.getSession('user').then((value) {
      stateData['auth'] = value;
      emit(stateData);
    });
  }

  // Home Event
  void onInitialPageHome() async {
    await getProductHome().then((value) {
      getCartHome();
    });
  }

  void onChangeMenuScrollPositionHome(double position) {
    Map<String, dynamic> stateData = {...state};
    stateData['home']['menu_scroll_position'] = position;
    emit(stateData);
  }

  Future getProductHome() async {
    Map<String, dynamic> stateData = {...state};
    await Repo.instance.getProduct().then((value) {
      stateData['home']['product']['proccess'] = value.isEmpty ? "empty" : "done";
      stateData['home']['product']['data'] = value;
      emit(stateData);
    });
  }

  void getCurrentProductHome(String productId) async {
    Map<String, dynamic> stateData = {...state};
    await Repo.instance.getProduct(filter: 'filter[id]=$productId').then((value) {
      stateData['home']['product_current']['proccess'] = value.isEmpty ? "empty" : "done";
      stateData['home']['product_current']['data'] = value.isEmpty ? {} : value[0];
      emit(stateData);
    });
  }

  void getCartHome() async {
    Map<String, dynamic> stateData = {...state};
    if (stateData['auth'] != null) {
      await Repo.instance.getCart(token: stateData['auth']?['token'], filter: 'filter[status]=active').then((value) {
        stateData['home']['cart']['proccess'] = value.isEmpty ? "empty" : "done";
        stateData['home']['cart']['data'] = value.isEmpty ? {} : value[0];
        emit(stateData);
      });
    }
  }

  void addCartHome(BuildContext context, {int productId = 0, int productPriceId = 0}) async {
    Map<String, dynamic> stateData = {...state};
    await Repo.instance.addCart(
      token: stateData['auth']['token'],
      body: {
        'product_id': productId.toString(),
        'product_price_id': productPriceId.toString(),
      },
    ).then((value) {
      Navigator.of(context).pop();
      getCartHome();
    });
  }

  // Event Order
  void onInitialPageOrder() {
    if (state['auth'] != null) onChangeTabOrder(state['order']['tab_current']['key'] ?? 0);
  }

  void onChangeTabOrder(int index) {
    Map<String, dynamic> stateData = {...state};
    List<dynamic> tab = stateData['order']['tab'] as List<dynamic>;

    tab.asMap().forEach((indexChild, item) {
      stateData['order']['tab'][indexChild]['is_active'] = false;
    });

    stateData['order']['tab_current'] = stateData['order']['tab'][index];
    stateData['order']['tab'][index]['is_active'] = true;
    emit(stateData);
    if (index <= 2) getOrder(status: stateData['order']['tab'][index]['key_data']);
  }

  void getOrder({String status = ''}) async {
    Map<String, dynamic> stateData = {...state};
    await Repo.instance
        .getOrder(
            token: stateData['auth']['token'],
            filter: 'filter[status]=$status',
            sort: 'sort=-id',
            include: 'include=orderProductModel')
        .then((value) {
      stateData['order'][status]['proccess'] = value.isEmpty ? "empty" : "done";
      stateData['order'][status]['data'] = value;
      emit(stateData);
    });
  }

  // Event biodata
  void logout(BuildContext context) async {
    await LocalStorage.instance.logout().then(
          (value) => Navigator.of(context).pushNamedAndRemoveUntil(RouteName.LOGIN, (route) => false),
        );
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
