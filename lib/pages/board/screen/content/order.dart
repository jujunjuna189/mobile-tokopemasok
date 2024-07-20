import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tokopemasok/pages/board/bloc/bloc_board.dart';
import 'package:tokopemasok/pages/board/widget/empty/empty_order.dart';
import 'package:tokopemasok/pages/board/widget/shimmer/shimmer_order.dart';
import 'package:tokopemasok/routes/route_name.dart';
import 'package:tokopemasok/services/formatter/formatter.dart';
import 'package:tokopemasok/utils/theme/theme.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    BlocBoard blocBoard = context.read<BlocBoard>();
    return Column(
      children: [
        BlocBuilder<BlocBoard, dynamic>(
          bloc: blocBoard,
          builder: (context, state) {
            List<dynamic> tab = state['order']['tab'] as List<dynamic>;
            return SizedBox(
              height: 29,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                scrollDirection: Axis.horizontal,
                itemCount: tab.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: GestureDetector(
                      onTap: () => blocBoard.onChangeTabOrder(index),
                      child: Text(
                        tab[index]['title'].toString(),
                        style: TextStyle(
                          fontSize: tab[index]['is_active'] ? 11.8.sp : 11.sp,
                          color: ThemeApp.color.dark,
                          fontWeight: tab[index]['is_active'] ? FontWeight.w700 : FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
        Expanded(
          child: BlocBuilder<BlocBoard, dynamic>(
            builder: (context, state) {
              if (state['order'][state['order']['tab_current']['key_data']]['proccess'] == '') {
                return const ShimmerOrder();
              } else if (state['order'][state['order']['tab_current']['key_data']]['proccess'] == 'empty') {
                return EmptyOrder(
                  text: state['order']['tab_current']['title'],
                );
              } else {
                List<dynamic> data = state['order'][state['order']['tab_current']['key_data']]['data'];
                return ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  children: data.map((item) {
                    return GestureDetector(
                      onTap: () => Navigator.of(context).pushNamed(
                        RouteName.ORDER,
                        arguments: jsonEncode({"id": item['id']?.toString() ?? '0'}),
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: ThemeApp.color.mutedLight),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${item['qty'].toString()} Pesanan",
                                  style: ThemeApp.font.semiBold,
                                ),
                                Text(
                                  Formatter.instance.price(
                                    double.parse(item['total'] ?? '0'),
                                    decimalDigits: 0,
                                  ),
                                  style: ThemeApp.font.semiBold.copyWith(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Nomor: ${item['order_number'].toString()}",
                                  style: ThemeApp.font.regular.copyWith(
                                    fontSize: 11,
                                  ),
                                ),
                                Text(
                                  Formatter.instance.dateV1(item['created_at'].toString()),
                                  style: ThemeApp.font.regular.copyWith(
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: ThemeApp.color.mutedLight,
                            ),
                            RichText(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                style: ThemeApp.font.regular.copyWith(
                                  color: ThemeApp.color.muted,
                                  fontSize: 11,
                                ),
                                children: (item['order_product_model'] as List).asMap().entries.map((itemChild) {
                                  return TextSpan(
                                    children: [
                                      TextSpan(text: itemChild.value['qty'].toString(), style: ThemeApp.font.bold),
                                      TextSpan(text: 'kg ', style: ThemeApp.font.regular.copyWith(fontSize: 9)),
                                      TextSpan(
                                        text:
                                            "${itemChild.value['order_product_history_model']?['title'] ?? ''} ${itemChild.key == ((item['order_product_model'] as List).length - 1) ? '' : ','} ",
                                      ),
                                    ],
                                  );
                                }).toList(),
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
        ),
      ],
    );
  }
}
