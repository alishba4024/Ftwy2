import 'package:flutter/material.dart';
import 'package:ftwy2/colors_constants.dart';
import 'package:ftwy2/subscription.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';

class Endgamescreen extends StatefulWidget {
  const Endgamescreen({super.key});

  @override
  State<Endgamescreen> createState() => _EndgamescreenState();
}

class _EndgamescreenState extends State<Endgamescreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double padding = screenWidth * 0.09;

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
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          Column(
            children: [
              SizedBox(height: 330),

              // Main Text
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: Column(
                  children: [
                    Text(
                      'Congratulations',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: screenWidth * 0.11,
                        fontWeight: FontWeight.w500,
                        color: AppColors.clr,
                        fontFamily: 'Schyler',
                      ),
                    ),
                    Text(
                      'On Knowing',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: screenWidth * 0.11,
                        fontWeight: FontWeight.w500,
                        color: AppColors.clr,
                        fontFamily: 'Schyler',
                      ),
                    ),
                    Text(
                      'More About\nYour Partner.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: screenWidth * 0.11, // Scalable font size
                        fontWeight: FontWeight.w500,
                        color: AppColors.clr,
                        fontFamily: 'Schyler',
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.09),

              // Play as Guest Player Button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(Subscription());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.btnclr,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                    minimumSize: Size(screenWidth * 0.8, 50),
                  ),
                  child: Text(
                    'Click Here To Subscribe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.043,
                      fontFamily: 'Schyler',
                    ),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ],
      ),
    );
  }
}
