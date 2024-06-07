import 'package:flutter/material.dart';
import 'package:flutter_application_5/colors/color.dart';

class AppointmentProgressItem extends StatelessWidget {
  final int progress;
  final int total;
  final String title;

  const AppointmentProgressItem({
    super.key,
    required this.progress,
    required this.total,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors
            .primaryColor, // Make sure this color is defined in your colors file
      ),
      width: 130,
      height: 140,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(
                    value: progress / total,
                    valueColor: const AlwaysStoppedAnimation<Color>(AppColors
                        .backgroundColor), // Make sure this color is defined in your colors file
                    strokeWidth: 4,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '$progress',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: AppColors.backgroundColor,
                        ),
                      ),
                      const TextSpan(
                        text: ' / ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: '$total ',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors
                  .backgroundColor, // Make sure this color is defined in your colors file
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
