import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tokopemasok/pages/board/bloc/bloc_board.dart';
import 'package:tokopemasok/services/formatter/formatter.dart';
import 'package:tokopemasok/utils/theme/theme.dart';
import 'package:tokopemasok/widgets/atoms/arrow/arrow_down.dart';
import 'package:tokopemasok/widgets/atoms/button/button.dart';

class ModalProductOrder {
  ModalProductOrder._privateConstructor();
  static final instance = ModalProductOrder._privateConstructor();

  void show(BuildContext context) {
    BlocBoard blocBoard = context.read<BlocBoard>();

    showModalBottomSheet(
      // constraints:
      //     BoxConstraints.loose(Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height * 0.90)),
      constraints:
          BoxConstraints.loose(Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height * 0.70)),
      isScrollControlled: true,
      backgroundColor: ThemeApp.color.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) => BlocBuilder<BlocBoard, dynamic>(
        bloc: blocBoard,
        builder: (context, state) {
          Map product = state['home']['product_current']['data'] as Map;
          return ModalProductOrderBuilder(
            product: product,
            onAdd: () => {
              blocBoard.addCartHome(
                context,
                productId: state['home']['product_current']['data']['id'],
                productPriceId: state['home']['product_current']['data']['price']['id'],
              ),
            },
          );
        },
      ),
    );
  }
}

class ModalProductOrderBuilder extends StatelessWidget {
  const ModalProductOrderBuilder({super.key, required this.product, this.onAdd});
  final Map product;
  final Function()? onAdd;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
          child: ArrowDown(title: product['title']),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            children: [
              Container(
                width: double.infinity,
                height: 40.h,
                decoration: BoxDecoration(
                  color: ThemeApp.color.mutedLight,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: ThemeApp.color.mutedLight),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: product['image'] != null
                      ? Image.network(
                          product['image'] ?? '',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Icon(
                            Icons.image_outlined,
                            size: 100,
                            color: ThemeApp.color.white,
                          ),
                        )
                      : Icon(
                          Icons.image_outlined,
                          size: 100,
                          color: ThemeApp.color.white,
                        ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Formatter.instance.price(product['price'] != null ? double.parse(product['price']['price']) : 0,
                        decimalDigits: 0),
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                        decoration:
                            BoxDecoration(color: ThemeApp.color.successLight, borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "Tersedia",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 8, color: ThemeApp.color.success),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                product['detail'] ?? '',
                style: TextStyle(fontSize: 14, color: ThemeApp.color.muted),
              ),
              const SizedBox(
                height: 20,
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
              text: "Tambah Pesanan",
              onPressed: onAdd,
            ),
          ),
        ),
      ],
    );
  }
}
