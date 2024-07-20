import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tokopemasok/pages/board/bloc/bloc_board.dart';
import 'package:tokopemasok/utils/theme/theme.dart';
import 'package:tokopemasok/widgets/molecules/help/help_admin.dart';
import 'package:tokopemasok/widgets/molecules/screen/screen_no_auth.dart';

class PageBoard extends StatelessWidget {
  const PageBoard({super.key});

  @override
  Widget build(BuildContext context) {
    BlocBoard blocBoard = context.read<BlocBoard>();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 23,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<BlocBoard, dynamic>(
                    bloc: blocBoard,
                    builder: (context, state) {
                      Widget topNavigation = state['bottom_navigation_current']['top_navigation'] as Widget;
                      return Expanded(child: topNavigation);
                    }),
                const SizedBox(
                  width: 20,
                ),
                // const Icon(Icons.notifications_outlined),
                // const SizedBox(
                //   width: 5,
                // ),
                const HelpAdmin(),
              ],
            ),
          ),
          BlocBuilder<BlocBoard, dynamic>(
            bloc: blocBoard,
            builder: (context, state) {
              Widget content = state['bottom_navigation_current']['content'] as Widget;
              if (state['bottom_navigation_current']['auth'] && state['auth'] == null) {
                return const Expanded(child: ScreenNoAuth());
              } else {
                return Expanded(child: content);
              }
            },
          ),
        ],
      ),
      bottomNavigationBar: BlocBuilder<BlocBoard, dynamic>(
        bloc: blocBoard,
        builder: (context, state) {
          List<dynamic> bottomNavigation = state['bottom_navigation'] as List<dynamic>;
          return BottomAppBar(
            height: 48,
            elevation: 10,
            padding: EdgeInsets.zero,
            shadowColor: ThemeApp.color.dark,
            surfaceTintColor: ThemeApp.color.white,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: ThemeApp.color.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: bottomNavigation.asMap().entries.map((item) {
                  if (item.value['design'] == 'circle') {
                    return buttonCircle(context, blocBoard, item);
                  } else {
                    return buttonNormal(blocBoard, item);
                  }
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buttonNormal(BlocBoard blocBoard, MapEntry<int, dynamic> item) {
    return GestureDetector(
      onTap: (() => blocBoard.onChangeBottomNavigation(item.key)),
      child: Column(
        children: [
          // ignore: deprecated_member_use
          SvgPicture.asset(
            item.value["image"].toString(),
            color: item.value["is_active"] ? ThemeApp.color.primary : ThemeApp.color.muted,
            width: 22,
          ),
          item.value["title"] != null
              ? Text(item.value["title"],
                  style: TextStyle(
                    fontSize: 9,
                    color: item.value["is_active"] ? ThemeApp.color.primary : ThemeApp.color.muted,
                    fontWeight: item.value["is_active"] ? FontWeight.bold : FontWeight.w500,
                  ))
              : Container(),
        ],
      ),
    );
  }

  Widget buttonCircle(BuildContext context, BlocBoard blocBoard, MapEntry<int, dynamic> item) {
    return GestureDetector(
      onTap: item.value['on_press'] != null ? (() => item.value['on_press'](context, blocBoard)) : null,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: ThemeApp.color.primary,
          borderRadius: BorderRadius.circular(50),
        ),
        child: SvgPicture.asset(
          item.value["image"].toString(),
          color: ThemeApp.color.white,
          width: 22,
        ),
      ),
    );
  }
}
