import 'package:eductionsystem/Constants/const.dart';
import 'package:flutter/material.dart';

import '../../../../../Constants/FontsConst.dart';

class HomeCards extends StatelessWidget {
  const HomeCards({
    super.key,
    this.title = 'Title',
    this.color = Colors.blue,
    this.percentage = 0.3,
    required this.svgAssetPath,
    this.onPressed,
  });

  final num percentage;
  final Color color;
  final String title;
  final String svgAssetPath;
  final VoidCallback? onPressed;
  final double spacing = 4.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 90,
              width: 150,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.all(spacing),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: AppFonts.manropeNormal16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
