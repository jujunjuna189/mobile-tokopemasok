import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tokopemasok/pages/order/bloc/bloc_order.dart';
import 'package:tokopemasok/pages/order/widget/shimmer/shimmer_information_order.dart';
import 'package:tokopemasok/pages/order/widget/shimmer/shimmer_product.dart';
import 'package:tokopemasok/services/formatter/formatter.dart';
import 'package:tokopemasok/utils/theme/theme.dart';
import 'package:tokopemasok/widgets/atoms/arrow/arrow_back.dart';
import 'package:tokopemasok/widgets/atoms/button/button.dart';
import 'package:tokopemasok/widgets/atoms/shimmer/shimmer_rectangle.dart';
import 'package:tokopemasok/widgets/molecules/help/help_admin.dart';

class PageOrder extends StatelessWidget {
  const PageOrder({super.key});

  @override
  Widget build(BuildContext context) {
    BlocOrder blocOrder = context.read<BlocOrder>();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ArrowBack(
                  title: 'Pesanan',
                ),
                HelpAdmin(),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Nomor Pesanan",
                        style: ThemeApp.font.regular.copyWith(fontSize: 12),
                      ),
                      BlocBuilder<BlocOrder, dynamic>(
                        bloc: blocOrder,
                        builder: (context, state) {
                          if (state['order']['proccess'] == '') {
                            return ShimmerRectangle(
                              width: 35.w,
                              height: 15,
                            );
                          } else {
                            return Text(
                              state['order']?['data']?['order_number'] ?? '',
                              style: ThemeApp.font.bold.copyWith(fontSize: 18, color: ThemeApp.color.dark, height: 1),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                  Divider(
                    color: ThemeApp.color.mutedLight,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Detail Pengantaran",
                          style: TextStyle(
                            fontSize: 14,
                            height: 1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Pesanan anda akan sampai 1-2 hari kerja, jika ada keterlambatan silahkan tekan pusat bantuan diatas!!",
                          style: TextStyle(fontSize: 9, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: ThemeApp.color.mutedLight),
                          borderRadius: const BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Pengantaran", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                            decoration: BoxDecoration(
                                color: ThemeApp.color.light,
                                border: Border.all(width: 1, color: ThemeApp.color.light),
                                borderRadius: const BorderRadius.all(Radius.circular(10))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BlocBuilder<BlocOrder, dynamic>(
                                  bloc: blocOrder,
                                  builder: (context, state) {
                                    if (state['order']['proccess'] == '') {
                                      return ShimmerRectangle(
                                        width: 25.w,
                                        height: 13,
                                      );
                                    } else {
                                      return Text(
                                        state['order']['data']?['delivery'] ?? '',
                                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                                      );
                                    }
                                  },
                                ),
                                const Text(
                                  "Pesanan akan di antar dengan layanan kami...",
                                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: ThemeApp.color.mutedLight),
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Alamat Pengantaran", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                          const SizedBox(
                            height: 2,
                          ),
                          BlocBuilder<BlocOrder, dynamic>(
                            bloc: blocOrder,
                            builder: (context, state) {
                              if (state['order']['proccess'] == '') {
                                return ShimmerRectangle(
                                  width: 40.w,
                                  height: 13,
                                );
                              } else {
                                return Text(
                                  state['order']['data']?['address'] ?? '',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Informasi Pesanan",
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        BlocBuilder<BlocOrder, dynamic>(
                          bloc: blocOrder,
                          builder: (context, state) {
                            if (state['order']['proccess'] == '') {
                              return const ShimmerInformationOrder();
                            } else if (state['order']['proccess'] == 'empty') {
                              return const Text("Data Kosong");
                            } else {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: (state['order']['data']['order_status_model'] as List).map(
                                  (item) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(3),
                                            decoration: BoxDecoration(
                                              color: ThemeApp.color.success,
                                              borderRadius: BorderRadius.circular(50),
                                            ),
                                            child: Icon(
                                              Icons.circle,
                                              size: 8,
                                              color: ThemeApp.color.white,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                RichText(
                                                  text: TextSpan(
                                                    style: ThemeApp.font.regular.copyWith(
                                                      fontSize: 10,
                                                      color: ThemeApp.color.dark,
                                                      height: 1,
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: Formatter.instance.timeV1(item['created_at'].toString()),
                                                      ),
                                                      const TextSpan(text: " - "),
                                                      TextSpan(
                                                        text: Formatter.instance.dateV1(item['created_at'].toString()),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Text(
                                                  item['description'] ?? "",
                                                  style: ThemeApp.font.semiBold.copyWith(
                                                    fontSize: 10,
                                                    color: ThemeApp.color.dark,
                                                    height: 1,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ).toList(),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: ThemeApp.color.mutedLight,
                  ),
                  BlocBuilder<BlocOrder, dynamic>(
                    bloc: blocOrder,
                    builder: (context, state) {
                      if (state['order']['proccess'] == '') {
                        return const ShimmerProduct();
                      } else if (state['order']['proccess'] == 'empty') {
                        return const Text("Data Kosong");
                      } else {
                        List<dynamic> order = state['order']['data']['order_product_model'];
                        return ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: order.map((item) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: ThemeApp.color.mutedLight),
                                  borderRadius: const BorderRadius.all(Radius.circular(10))),
                              child: Row(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: ThemeApp.color.mutedLight,
                                      border: Border.all(width: 1, color: ThemeApp.color.mutedLight),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: item['order_product_history_model']?['image'] != null
                                        ? ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image.network(
                                              item['order_product_history_model']['image'].toString(),
                                              width: double.infinity,
                                              height: double.infinity,
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error, stackTrace) => Icon(
                                                Icons.image_outlined,
                                                size: 25,
                                                color: ThemeApp.color.white,
                                              ),
                                            ),
                                          )
                                        : null,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          item['order_product_history_model']?['title']?.toString() ?? '',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              Formatter.instance.decimal(
                                                double.parse(
                                                  item['order_product_price_history_model']?['price'] ?? '0',
                                                ),
                                                decimalDigits: 0,
                                              ),
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                style: ThemeApp.font.semiBold
                                                    .copyWith(fontSize: 11.sp, color: ThemeApp.color.dark),
                                                children: [
                                                  TextSpan(text: item['qty'].toString()),
                                                  TextSpan(
                                                    text: 'kg',
                                                    style: ThemeApp.font.regular.copyWith(fontSize: 8.sp),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Divider(
                    color: ThemeApp.color.mutedLight,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    child: Text(
                      "Ringkasan Pembayaran",
                      style: TextStyle(
                        fontSize: 14,
                        height: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: ThemeApp.color.mutedLight),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Harga",
                                style: ThemeApp.font.regular,
                              ),
                              BlocBuilder<BlocOrder, dynamic>(
                                bloc: blocOrder,
                                builder: (context, state) {
                                  if (state['order']['proccess'] == '') {
                                    return ShimmerRectangle(
                                      width: 18.w,
                                      height: 13,
                                    );
                                  } else {
                                    return Text(
                                      Formatter.instance.decimal(
                                        double.parse(state['order']?['data']?['total']?.toString() ?? '0'),
                                        decimalDigits: 0,
                                      ),
                                      style: ThemeApp.font.regular,
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                          Divider(
                            color: ThemeApp.color.mutedLight,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Pembayaran",
                                style: ThemeApp.font.bold,
                              ),
                              BlocBuilder<BlocOrder, dynamic>(
                                bloc: blocOrder,
                                builder: (context, state) {
                                  if (state['order']['proccess'] == '') {
                                    return ShimmerRectangle(
                                      width: 18.w,
                                      height: 13,
                                    );
                                  } else {
                                    return Text(
                                      Formatter.instance.decimal(
                                        double.parse(state['order']?['data']?['total']?.toString() ?? '0'),
                                        decimalDigits: 0,
                                      ),
                                      style: ThemeApp.font.bold,
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<BlocOrder, dynamic>(
                    bloc: blocOrder,
                    builder: (context, state) {
                      bool cancelStatus =
                          state['order']?['data']?['order_status_model']?[0]?['status'] == 'processed' ? true : false;
                      if (cancelStatus && state['order']['proccess'] != '') {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(color: ThemeApp.color.white),
                          child: SizedBox(
                            width: double.infinity,
                            child: Button(
                              text: "Batalkan Pesanan",
                              onPressed: () => blocOrder.onAddOrderStatus(),
                              color: ThemeApp.color.danger,
                            ),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
