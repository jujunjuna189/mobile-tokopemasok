import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokopemasok/pages/onboarding/bloc/bloc_onboarding.dart';
import 'package:tokopemasok/utils/theme/theme.dart';
import 'package:tokopemasok/widgets/atoms/button/button.dart';

class PageOnboarding extends StatelessWidget {
  const PageOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    BlocOnboarding blocOnboarding = context.read<BlocOnboarding>();
    PageController controller = PageController();

    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<BlocOnboarding, dynamic>(
            bloc: blocOnboarding,
            builder: (context, state) {
              dynamic data = state['data'];
              return PageView.builder(
                controller: controller,
                itemCount: data.length,
                onPageChanged: (page) {
                  blocOnboarding.onChangeCurrentData(page);
                },
                itemBuilder: (_, i) {
                  return data[i]['page'];
                },
              );
            },
          ),
          BlocBuilder<BlocOnboarding, dynamic>(
            bloc: blocOnboarding,
            builder: (context, state) {
              List<dynamic> data = state['data'] as List<dynamic>;
              int dataIndex = context.select<BlocOnboarding, dynamic>((value) => value.state['current_data']) as int;
              return data[dataIndex]['is_button']
                  ? Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: data
                            .asMap()
                            .map((i, value) => MapEntry(
                                i,
                                value['is_button']
                                    ? Container(
                                        width: i == dataIndex ? 16 : 8,
                                        height: 8,
                                        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 20),
                                        decoration: BoxDecoration(
                                          color: i == dataIndex ? ThemeApp.color.primary : ThemeApp.color.muted,
                                          borderRadius: BorderRadius.circular(100),
                                        ),
                                      )
                                    : Container()))
                            .values
                            .toList(),
                      ),
                    )
                  : Container();
            },
          ),
          BlocBuilder<BlocOnboarding, dynamic>(
              bloc: blocOnboarding,
              builder: (context, state) {
                List<dynamic> data = state['data'] as List<dynamic>;
                int dataIndex = context.select<BlocOnboarding, dynamic>((value) => value.state['current_data']) as int;
                return data[dataIndex]['is_button']
                    ? Positioned(
                        bottom: 10,
                        right: 10,
                        child: Button(
                          text: "Lanjut",
                          onPressed: () {
                            (data.length - 1) != dataIndex ? blocOnboarding.onChangeCurrentData(dataIndex + 1) : null;
                            (data.length - 1) != dataIndex ? controller.jumpToPage(dataIndex + 1) : null;
                          },
                        ),
                      )
                    : Container();
              }),
        ],
      ),
    );
  }
}
