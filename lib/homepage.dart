import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:ftwy2/colors_constants.dart';
import 'package:ftwy2/gamequestions.dart';
import 'package:ftwy2/localization/locales.dart';
import 'package:get/get.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            height: screenHeight,
            width: screenWidth,
            color: AppColors.themeclr,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: screenHeight * 0.7,
                width: screenWidth * 0.9,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Background Pattern.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          // Top bar with avatar and settings icon
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.1,
              left: screenWidth * 0.06,
              right: screenWidth * 0.06,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(1),
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: const CircleAvatar(
                            backgroundColor: Color(0xffE0E0E0),
                            radius: 24,
                            child: Icon(Icons.person, color: Colors.black),
                          ),
                        ),
                        Positioned(
                          bottom: -1,
                          right: -1,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Guest 919',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Schyler',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.settings, color: Colors.black),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          // Instructions box
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.09),
            child: Center(
              child: Container(
                height: screenHeight * 0.5,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(27),
                ),
                child: Container(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Colors.red,
                      width: 4,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Instructions'.tr,
                        style: TextStyle(
                          fontSize: 37,
                          fontFamily: 'Schyler',
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${'InstructionDes'.tr} ${'InstructionDes2'.tr}',
                        style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 0.9,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Bottom buttons
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.04),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Get.to(Gamequestions());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.btnclr,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                        minimumSize: Size(screenWidth * 0.8, 40),
                        elevation: 3,
                      ),
                      child: Text(
                        'StartGame'.tr,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.045,
                          fontFamily: 'Schyler',
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.012),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'SubscriptionText'.tr,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
