import 'package:flutter/material.dart';
import 'package:flutter_application_5/colors/color.dart';

class InitialLoginScreen extends StatelessWidget {
  const InitialLoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: mediaquery.size.width * 0.5,
            decoration: const BoxDecoration(
                color: AppColors.backgroundColor,
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/doctor.png',
                    ),
                    fit: BoxFit.contain)),
          ),
          Container(
            width: mediaquery.size.width * 0.5,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0), 
                bottomLeft:
                    Radius.circular(20.0), 
              ),
              color: Colors.white,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: mediaquery.size.height * 0.1,
                  ),
                  const Text(
                    "SAPDOS",
                    style: TextStyle(
                        fontSize: 34, 
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor),
                  ),
                  SizedBox(
                    height: mediaquery.size.height * 0.14,
                  ),
                  const Text(
                    "Login to your Sapdos account or create new one.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor),
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text(
                      "     Login     ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 35),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.primaryColor,
                      side: const BorderSide(
                        width: 2.0,
                        color: AppColors.primaryColor,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: const Text(
                      "   Sign-up   ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor),
                    ),
                  ),
                  SizedBox(
                    height: mediaquery.size.height * 0.09,
                  ),
                  TextButton(
                    onPressed: () {
                    
                    },
                    child: const Text(
                      "Proceed as a Guest",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.accentColor, 
                          decorationThickness: 2,
                          color: AppColors.accentColor
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
