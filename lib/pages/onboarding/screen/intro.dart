import 'package:flutter/material.dart';
import 'package:tokopemasok/utils/theme/theme.dart';

class Intro extends StatelessWidget {
  const Intro({super.key, this.image, this.title = '', this.description = '', this.themeColor = Colors.white});

  final String? image;
  final String title;
  final String description;
  final Color? themeColor;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: themeColor!,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(
            //   data[i]['image'],
            //   width: MediaQuery.of(context).size.width / 2,
            //   height: MediaQuery.of(context).size.width / 2,
            //   fit: BoxFit.fill,
            // ),
            const SizedBox(
              height: 30,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ThemeApp.color.dark),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
