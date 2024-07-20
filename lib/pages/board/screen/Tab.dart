import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tokopemasok/pages/board/bloc/bloc_board.dart';
import 'package:tokopemasok/utils/theme/theme.dart';

class WidgetTab extends StatelessWidget {
  const WidgetTab({super.key});

  @override
  Widget build(BuildContext context) {
    BlocBoard blocOnboard = context.read<BlocBoard>();

    return BlocBuilder<BlocBoard, dynamic>(
      bloc: blocOnboard,
      builder: (context, state) {
        List<dynamic> tab = state['bottom_navigation_current']['tab'] as List<dynamic>;
        return SizedBox(
          height: 29,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(right: 8, top: 4),
            scrollDirection: Axis.horizontal,
            itemCount: tab.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: GestureDetector(
                  onTap: () => blocOnboard.onChangeTab(index),
                  child: Text(
                    tab[index]['title'].toString(),
                    style: TextStyle(
                        fontSize: tab[index]['is_active'] ? 11.8.sp : 11.sp,
                        color: ThemeApp.color.dark,
                        fontWeight: tab[index]['is_active'] ? FontWeight.w700 : FontWeight.normal),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
