import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:ftwy2/colors_constants.dart';
import 'package:ftwy2/homepage.dart';
import 'package:ftwy2/localization/locales.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double padding = screenWidth * 0.08;

    return Scaffold(
      body: Stack(
        children: [
          // Background Container
          Container(
            height: screenHeight,
            width: screenWidth,
            color: AppColors.themeclr,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: screenHeight * 0.6,
                width: screenWidth * 0.8,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Background Pattern.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),

          Column(
            children: [
              // Logo at the top
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.1),
                child: Center(
                  child: Container(
                    height: screenWidth * 0.35,
                    width: screenWidth * 0.45,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/logo.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.03),

              // Main Text
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: Column(
                  children: [
                    Text(
                      'Find Your',
                      // LocalData.body.getString(context),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: screenWidth * 0.11,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffCE1C24),
                        fontFamily: 'Schyler',
                      ),
                    ),
                    Text(
                      // LocalData.text.getString(context),
                      'Ice Breaker\nQuestions',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: screenWidth * 0.12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.clr,
                        fontFamily: 'Schyler',
                      ),
                    ),
                    Text(
                      // LocalData.text1.getString(context),
                      'To Know More About Your Partner.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: screenWidth * 0.11, // Scalable font size
                        fontWeight: FontWeight.w500,
                        color: Color(0xffCE1C24),
                        fontFamily: 'Schyler',
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.05),

              // Play as Guest Player Button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(Homepage());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.btnclr,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                      minimumSize: Size(screenWidth * 0.8, 40),
                      elevation: 3),
                  child: Text(
                    'onboardingBtn'.tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.043,
                      fontFamily: 'Schyler',
                    ),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.01),

              // Subscription Text
              Text(
                'SubscriptionText'.tr,
                // 'Subscribe \$4.99 Full Access 50 Questions',
                style: TextStyle(
                  fontSize: screenWidth * 0.031,
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
