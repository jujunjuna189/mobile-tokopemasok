import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tokopemasok/pages/cart/bloc/bloc_cart.dart';
import 'package:tokopemasok/pages/cart/widget/empty/empty_cart.dart';
import 'package:tokopemasok/pages/cart/widget/modal/modal_address.dart';
import 'package:tokopemasok/pages/cart/widget/shimmer/shimmer_product.dart';
import 'package:tokopemasok/services/formatter/formatter.dart';
import 'package:tokopemasok/utils/theme/theme.dart';
import 'package:tokopemasok/widgets/atoms/arrow/arrow_back.dart';
import 'package:tokopemasok/widgets/atoms/button/button.dart';
import 'package:tokopemasok/widgets/atoms/button/button_outline.dart';
import 'package:tokopemasok/widgets/atoms/shimmer/shimmer_rectangle.dart';
import 'package:tokopemasok/widgets/molecules/counter_button/counter_button.dart';
import 'package:tokopemasok/widgets/molecules/help/help_admin.dart';
import 'package:tokopemasok/widgets/molecules/screen/screen_no_auth.dart';

class PageCart extends StatelessWidget {
  const PageCart({super.key});

  @override
  Widget build(BuildContext context) {
    BlocCart blocCart = context.read<BlocCart>();
    dynamic auth = context.select<BlocCart, dynamic>((value) => value.state['auth']);
    String cartProccess = context.select<BlocCart, dynamic>(
      (value) => (value.state['cart']['proccess']),
    ) as String;
    List cartData = context.select<BlocCart, dynamic>(
      (value) => (value.state['cart']['data']['cart_product_model'] ?? []),
    ) as List;

    if (auth == null) {
      return const ScreenNoAuth();
    } else if (cartProccess != "" && cartData.isEmpty) {
      return const EmptyCart();
    } else {
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            color: ThemeApp.color.light, borderRadius: const BorderRadius.all(Radius.circular(5))),
                        child: Row(
                          children: [
                            Icon(
                              Icons.delivery_dining_sharp,
                              size: 18,
                              color: ThemeApp.color.primary,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Pesanan diantar sesuai yang di jadwalkan',
                              style:
                                  TextStyle(fontSize: 12, color: ThemeApp.color.primary, fontWeight: FontWeight.w500),
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
                                  BlocBuilder<BlocCart, dynamic>(
                                    bloc: blocCart,
                                    builder: (context, state) {
                                      if (state['cart']['proccess'] == '') {
                                        return ShimmerRectangle(
                                          width: 25.w,
                                          height: 13,
                                        );
                                      } else {
                                        return Text(
                                          state['cart']['data']?['delivery'] ?? '',
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
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Alamat Pengantaran",
                                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  BlocBuilder<BlocCart, dynamic>(
                                    bloc: blocCart,
                                    builder: (context, state) {
                                      if (state['cart']['proccess'] == '') {
                                        return ShimmerRectangle(
                                          width: 40.w,
                                          height: 13,
                                        );
                                      } else {
                                        return Text(
                                          state['cart']['data']?['address'] ?? 'Silahkan ubah alamat pengantaran anda',
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
                            ButtonOutline(
                              text: "Ubah",
                              paddingTop: 5,
                              paddingBottom: 5,
                              onPressed: () => {blocCart.getUserAddress(), ModalAddress.instance.show(context)},
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Divider(
                      color: ThemeApp.color.mutedLight,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Apa ada pesanan lain ?",
                                  style: TextStyle(
                                    fontSize: 14,
                                    height: 1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Tambah lagi pesanan?",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ButtonOutline(
                            text: "Pesan Lagi",
                            paddingTop: 5,
                            paddingBottom: 5,
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<BlocCart, dynamic>(
                      bloc: blocCart,
                      builder: (context, state) {
                        if (state['cart']['proccess'] == '') {
                          return const ShimmerProduct();
                        } else if (state['cart']['proccess'] == 'empty') {
                          return const Text("Data Kosong");
                        } else {
                          List<dynamic> cart = state['cart']['data']['cart_product_model'];
                          return ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: cart.map((item) {
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
                                      child: item['product_model']?['image'] != null
                                          ? ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image.network(
                                                item['product_model']['image'].toString(),
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
                                            item['product_model']?['title']?.toString() ?? '',
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
                                                  double.parse(item['product_price_model']?['price'] ?? '0'),
                                                  decimalDigits: 0,
                                                ),
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                              CounterButton(
                                                value: item['qty'].toString(),
                                                unit: 'kg',
                                                width: 90,
                                                buttonSize: 10,
                                                buttonColor: ThemeApp.color.primary,
                                                onAdd: () => blocCart.onAddCart(
                                                  context,
                                                  productId: item['product_model']['id'],
                                                  productPriceId: item['product_price_model']['id'],
                                                  qty: item['qty'] + item['product_price_model']['qty'],
                                                ),
                                                onMin: () => blocCart.onAddCart(
                                                  context,
                                                  productId: item['product_model']['id'],
                                                  productPriceId: item['product_price_model']['id'],
                                                  qty: item['qty'] > 0
                                                      ? item['qty'] - item['product_price_model']['qty']
                                                      : 0,
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
                                BlocBuilder<BlocCart, dynamic>(
                                  bloc: blocCart,
                                  builder: (context, state) {
                                    if (state['cart']['proccess'] == '') {
                                      return ShimmerRectangle(
                                        width: 18.w,
                                        height: 13,
                                      );
                                    } else {
                                      return Text(
                                        Formatter.instance.decimal(
                                          double.parse(state['cart']?['data']?['sub_total']?.toString() ?? '0'),
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
                                BlocBuilder<BlocCart, dynamic>(
                                  bloc: blocCart,
                                  builder: (context, state) {
                                    if (state['cart']['proccess'] == '') {
                                      return ShimmerRectangle(
                                        width: 18.w,
                                        height: 13,
                                      );
                                    } else {
                                      return Text(
                                        Formatter.instance.decimal(
                                          double.parse(state['cart']?['data']?['sub_total']?.toString() ?? '0'),
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
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(color: ThemeApp.color.white),
                child: SizedBox(
                  width: double.infinity,
                  child: Button(
                    text: "Pesan dan Antarkan",
                    onPressed: () => blocCart.onAddOrder(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
