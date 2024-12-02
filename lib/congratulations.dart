import 'package:flutter/material.dart';
import 'package:ftwy2/colors_constants.dart';

class Congratulations extends StatefulWidget {
  const Congratulations({super.key});

  @override
  State<Congratulations> createState() => _CongratulationsState();
}

class _CongratulationsState extends State<Congratulations> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.themeclr,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo image
            Container(
              height: screenHeight * 0.3,
              width: screenWidth * 0.6,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/congrats.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // Welcome text
            Column(
              children: [
                Text(
                  'Congratulations!',
                  style: TextStyle(
                    fontSize: screenWidth * 0.06, // 8% of screen width
                    fontWeight: FontWeight.bold,
                    color: Color(0xff202226),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    'Your account is ready to use. You have now full access to 50 Questions. You will be redirected to the home page in a few seconds',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff838383),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
