import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../../Constants/ColorsConst.dart';
import '../../../../../Constants/FontsConst.dart';
import '../../../../../Constants/Icons.dart';

class ProgressOverView extends StatelessWidget {
  const ProgressOverView({
    Key? key,
    this.title = 'Title',
    this.color = Colors.blue,
    this.percentage = 0.3,
    required this.svgAssetPath,
    this.onPressed,
  }) : super(key: key);

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
                color: AppColors.blue1,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
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
                    Padding(
                      padding: EdgeInsets.all(spacing),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LinearPercentIndicator(
                            width: 100.0,
                            lineHeight: 5.0,
                            percent: percentage.toDouble(),
                            progressColor: color,
                            barRadius: const Radius.circular(10),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(spacing),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${(percentage * 100).toInt()} %",
                            textAlign: TextAlign.center,
                            style: AppFonts.robotoNormal14,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -10,
              right: -10,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.blue1, // Adjust color as needed
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Shadow color
                      spreadRadius: 2, // Spread radius
                      blurRadius: 5, // Blur radius
                      offset: const Offset(
                          0, 0), // Offset in the positive direction of Y axis
                    ),
                  ],
                ),
                child: Center(
                  child: SvgPicture.asset(
                    Check2,
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
