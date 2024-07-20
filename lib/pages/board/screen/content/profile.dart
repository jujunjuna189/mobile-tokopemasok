import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokopemasok/pages/board/bloc/bloc_board.dart';
import 'package:tokopemasok/utils/theme/theme.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    BlocBoard blocBoard = context.read<BlocBoard>();

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            children: [
              const Icon(
                Icons.account_circle_outlined,
                size: 50,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    blocBoard.state['auth']?['user']?['name']?.toString() ?? '',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    blocBoard.state['auth']?['user']?['email']?.toString() ?? '',
                    style: const TextStyle(fontSize: 12),
                  )
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Divider(
            color: ThemeApp.color.light,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: ThemeApp.color.mutedLight),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.admin_panel_settings_rounded),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Hapus Akun",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Icon(Icons.chevron_right),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        GestureDetector(
          onTap: () => blocBoard.logout(context),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: ThemeApp.color.mutedLight),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.logout_outlined),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Keluar Akun",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Icon(Icons.chevron_right),
              ],
            ),
          ),
        )
      ],
    );
  }
}
