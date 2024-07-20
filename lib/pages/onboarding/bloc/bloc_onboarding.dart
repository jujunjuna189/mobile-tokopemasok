import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tokopemasok/pages/onboarding/screen/intro.dart';
import 'package:tokopemasok/pages/onboarding/screen/prepare.dart';
import 'package:tokopemasok/utils/theme/theme.dart';

class BlocOnboarding extends Cubit<Map<String, dynamic>> {
  BlocOnboarding()
      : super({
          "data": [
            {
              "page": Intro(
                title: "Tokopemasok",
                description:
                    'Sedia produk dengan kebutuhan Anda sehari hari atau pemasok usaha, Tokopemasok tempatnya produk yang kamu butuhkan',
                themeColor: ThemeApp.color.light,
              ),
              "is_button": true,
            },
            {
              "page": Intro(
                title: "Jadwal Pengiriman",
                description: 'Jadwal pengiriman bisa di sesuaikan dengan jadwal pemesanan Anda',
                themeColor: ThemeApp.color.light,
              ),
              "is_button": true,
            },
            {
              "page": const Prepare(),
              "is_button": false,
            },
          ],
          "current_data": 0,
        });

  void onChangeCurrentData(int index) {
    Map<String, dynamic> stateData = {...state};
    stateData['current_data'] = index;
    emit(stateData);
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
