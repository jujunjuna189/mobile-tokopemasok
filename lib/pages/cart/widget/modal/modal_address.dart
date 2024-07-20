import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokopemasok/pages/cart/bloc/bloc_cart.dart';
import 'package:tokopemasok/utils/theme/theme.dart';
import 'package:tokopemasok/widgets/atoms/arrow/arrow_down.dart';
import 'package:tokopemasok/widgets/atoms/button/button_outline.dart';
import 'package:tokopemasok/widgets/atoms/field/field_area.dart';

class ModalAddress {
  ModalAddress._privateConstructor();
  static final instance = ModalAddress._privateConstructor();

  void show(BuildContext context) {
    BlocCart blocCart = context.read<BlocCart>();
    TextEditingController fullAddressController = TextEditingController();

    showModalBottomSheet(
      constraints: BoxConstraints.loose(
        Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height * 0.90),
      ),
      isScrollControlled: true,
      backgroundColor: ThemeApp.color.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) => ModalAddressBuilder(
        bloc: blocCart,
        fullAddressController: fullAddressController,
      ),
    );
  }
}

class ModalAddressBuilder extends StatelessWidget {
  const ModalAddressBuilder({super.key, required this.bloc, required this.fullAddressController});
  final BlocCart bloc;
  final TextEditingController fullAddressController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeApp.color.transparent,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
            child: ArrowDown(title: 'Pilih Alamat'),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              children: [
                Text(
                  "Tekan alamat untuk memilih alamat pengantaran",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: ThemeApp.color.muted,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                BlocBuilder<BlocCart, dynamic>(
                  bloc: bloc,
                  builder: (context, state) {
                    if (state['user_address']['proccess'] == 'empty') {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: ThemeApp.color.mutedLight),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Alamat pengantaran belum di tambahkan",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Silahkan tambah alamat pengantaran anda dibawah ini!",
                              style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w500,
                                color: ThemeApp.color.muted,
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Column(
                        children: (state['user_address']['data'] as List).map((item) {
                          return GestureDetector(
                            onTap: () => bloc.onUpdateCart(context, field: 'address', value: item['full_address']),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1, color: ThemeApp.color.mutedLight),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item['full_address']?.toString() ?? '',
                                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          "Pastikan alamat yang dimasukan sesuai dengan contoh",
                                          style: TextStyle(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w500,
                                            color: ThemeApp.color.muted,
                                          ),
                                        ),
                                        Text(
                                          "Contoh: (Dusun. Rt/Rw. Desa. Kec. Kab. Prov.)",
                                          style: TextStyle(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w500,
                                            color: ThemeApp.color.muted,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => bloc.onDeleteUserAddress(id: item['id']),
                                    child: Icon(
                                      Icons.remove_circle_outline,
                                      color: ThemeApp.color.muted,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Tambah alamat baru",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Contoh: (Dusun. Rt/Rw. Desa. Kec. Kab. Prov.) tambahkan jalan atau patokan agar kurir mudah menemukanmu",
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w500,
                    color: ThemeApp.color.muted,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                FieldArea(
                  controller: fullAddressController,
                  onChange: ((value) => bloc.onChangeUserAddress('full_address', value)),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  placeHolder: 'Tuliskan alamat lengkap pengantaran',
                  borderColor: ThemeApp.color.mutedLight,
                ),
                ButtonOutline(
                  text: "Tambah Alamat",
                  paddingTop: 8,
                  paddingBottom: 8,
                  onPressed: () => bloc.onAddUserAddress().then((value) {
                    if (value != false) {
                      fullAddressController.text = '';
                    }
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
