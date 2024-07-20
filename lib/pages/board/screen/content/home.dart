import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tokopemasok/pages/board/bloc/bloc_board.dart';
import 'package:tokopemasok/pages/board/widget/empty/empty_product.dart';
import 'package:tokopemasok/pages/board/widget/modal/modal_product_order.dart';
import 'package:tokopemasok/pages/board/widget/shimmer/shimmer_product.dart';
import 'package:tokopemasok/routes/route_name.dart';
import 'package:tokopemasok/services/formatter/formatter.dart';
import 'package:tokopemasok/utils/theme/theme.dart';
import 'package:tokopemasok/widgets/atoms/field/field_search.dart';
// import 'package:tokopemasok/widgets/molecules/scrollable/scrollable_horizontal.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    BlocBoard blocBoard = context.read<BlocBoard>();

    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 18.h,
                decoration: BoxDecoration(color: ThemeApp.color.mutedLight, borderRadius: BorderRadius.circular(15)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "assets/banner/banner.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: FieldSearch(
                        placeHolder: 'Cari Produk..',
                      ),
                    ),
                  ],
                ),
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              // SizedBox(
              //   height: 10.h,
              //   child: NotificationListener<ScrollNotification>(
              //     onNotification: (scrollNotification) {
              //       double position = (scrollNotification.metrics.pixels / scrollNotification.metrics.maxScrollExtent) * 100;
              //       blocBoard.onChangeMenuScrollPosition(position);
              //       return true;
              //     },
              //     child: ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       shrinkWrap: true,
              //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              //       itemCount: 12,
              //       itemBuilder: (context, index) {
              //         return Container(
              //           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              //           width: 10.h,
              //           height: double.infinity,
              //           decoration: BoxDecoration(color: ThemeApp.color.mutedLight, borderRadius: BorderRadius.circular(10)),
              //           child: const Text("Oke"),
              //         );
              //       },
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // // scrollable
              // BlocBuilder<BlocBoard, dynamic>(
              //   bloc: blocBoard,
              //   builder: (context, state) {
              //     return ScrollableHorizontal(
              //         width: 30, indicatorWidth: 15, height: 5, percentage: state['home']['menu_scroll_position']);
              //   },
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  color: ThemeApp.color.light,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 7),
                child: Text(
                  "Tersedia Sekarang",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              BlocBuilder<BlocBoard, dynamic>(
                bloc: blocBoard,
                builder: (context, state) {
                  if (state['home']['product']['proccess'] == '') {
                    return const ShimmerProduct();
                  } else if (state['home']['product']['proccess'] == 'empty') {
                    return const EmptyProduct();
                  } else {
                    List<dynamic> product = state['home']['product']['data'];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: Wrap(
                        children: product.map((item) {
                          return GestureDetector(
                            onTap: () => {
                              ModalProductOrder.instance.show(context),
                              blocBoard.getCurrentProductHome(item['id'].toString())
                            },
                            child: SizedBox(
                              width: 48.w,
                              child: Container(
                                margin: const EdgeInsets.all(3),
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: ThemeApp.color.mutedLight),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 20.h,
                                      decoration: BoxDecoration(
                                        color: ThemeApp.color.mutedLight,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: item['image'] != null
                                          ? ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image.network(
                                                item['image'].toString(),
                                                width: double.infinity,
                                                height: double.infinity,
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error, stackTrace) => Icon(
                                                  Icons.image_outlined,
                                                  size: 60,
                                                  color: ThemeApp.color.white,
                                                ),
                                              ),
                                            )
                                          : null,
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      item['title'].toString(),
                                      maxLines: 1,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Text(
                                      Formatter.instance.price(
                                          item['price'] != null ? double.parse(item['price']['price']) : 0,
                                          decimalDigits: 0),
                                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                                          decoration: BoxDecoration(
                                              color: ThemeApp.color.successLight,
                                              borderRadius: BorderRadius.circular(10)),
                                          child: Text(
                                            "Tersedia",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 8,
                                                color: ThemeApp.color.success),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        // Cart Fly
        BlocBuilder<BlocBoard, dynamic>(
            bloc: blocBoard,
            builder: (context, state) {
              if (state['home']['cart']['proccess'] == 'done') {
                Map cart = state['home']['cart']['data'] as Map;
                return Positioned(
                  left: 10,
                  right: 10,
                  bottom: 10,
                  child: GestureDetector(
                    onTap: () =>
                        Navigator.of(context).pushNamed(RouteName.CART).whenComplete(() => blocBoard.getCartHome()),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                      decoration: BoxDecoration(
                        color: ThemeApp.color.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${cart['qty'].toString()} Pesanan",
                                  style: ThemeApp.font.semiBold.copyWith(
                                    color: ThemeApp.color.white,
                                  ),
                                ),
                                Text(
                                  "Pesanan belum selesai nih..!",
                                  style: ThemeApp.font.regular.copyWith(
                                    color: ThemeApp.color.white,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            Formatter.instance.price(double.parse(cart['sub_total'] ?? '0'), decimalDigits: 0),
                            style: ThemeApp.font.semiBold.copyWith(
                              color: ThemeApp.color.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return Container();
              }
            }),
      ],
    );
  }
}
