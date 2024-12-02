import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ftwy2/colors_constants.dart';
import 'package:ftwy2/congratulations.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  bool isMonthlySelected = true;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.themeclr,
      appBar: AppBar(
        backgroundColor: AppColors.themeclr,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Subscription',
          style: TextStyle(
            color: Colors.black,
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 15),
            child: CircleAvatar(
              backgroundColor: Color(0xffE5E7EB),
              child: Icon(
                Icons.keyboard_arrow_left,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: screenHeight * 0.03),

            // Premium Banner
            Container(
              padding: EdgeInsets.all(screenWidth * 0.07),
              decoration: BoxDecoration(
                color: AppColors.btnclr,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/crown.svg',
                    color: Colors.white,
                    width: screenWidth * 0.15,
                    height: screenWidth * 0.15,
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Join Our Premium Page',
                          style: TextStyle(
                            fontFamily: 'Schyler',
                            color: Colors.white,
                            fontSize: screenWidth * 0.047,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Unlimited Features',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.040,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),

            // Monthly Plan
            GestureDetector(
              onTap: () {
                setState(() {
                  isMonthlySelected = true;
                });
              },
              child: Container(
                padding: EdgeInsets.all(screenWidth * 0.05),
                decoration: BoxDecoration(
                  color: isMonthlySelected ? Color(0xffB5ADA6) : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          isMonthlySelected
                              ? Icons.radio_button_checked
                              : Icons.radio_button_off,
                          color: Colors.red,
                        ),
                        SizedBox(width: screenWidth * 0.03),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Monthly',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * 0.048,
                              ),
                            ),
                            Text(
                              'Unlimited Access For 1 Month',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: screenWidth * 0.03,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      '\$4.99',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.045,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),

            // Yearly Plan
            GestureDetector(
              onTap: () {
                setState(() {
                  isMonthlySelected = false;
                });
              },
              child: Container(
                padding: EdgeInsets.all(screenWidth * 0.05),
                decoration: BoxDecoration(
                  color: isMonthlySelected ? Colors.white : Color(0xffB5ADA6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          isMonthlySelected
                              ? Icons.radio_button_off
                              : Icons.radio_button_checked,
                          color: Colors.red,
                        ),
                        SizedBox(width: screenWidth * 0.03),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Yearly',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * 0.048,
                              ),
                            ),
                            Text(
                              'Unlimited Access For 1 Year',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: screenWidth * 0.03,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '\$29.90',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.045,
                          ),
                        ),
                        Text(
                          'Save 50%',
                          style: TextStyle(
                            color: AppColors.clr,
                            fontSize: screenWidth * 0.037,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.06),

            // Proceed To Pay Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
              child: SizedBox(
                width: screenWidth * 0.8,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(Congratulations());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.btnclr,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 2,
                    padding:
                        EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                  ),
                  child: Text(
                    'Proceed To Pay',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Schyler',
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),

            // Cancel Subscription Link
            Center(
              child: GestureDetector(
                onTap: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Cancel Subscription',
                      style: TextStyle(
                        fontSize: screenWidth * 0.041,
                        fontFamily: 'Schyler',
                        color: AppColors.clr,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.04),

            // Terms of Service and Privacy Policy
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.03),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'By continuing, you have agreed to our',
                      style: TextStyle(
                        fontSize: screenWidth * 0.029,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Terms of Service ',
                          style: TextStyle(
                            fontSize: screenWidth * 0.029,
                            color: AppColors.clr,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '& ',
                          style: TextStyle(
                            fontSize: screenWidth * 0.029,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Privacy Policy',
                          style: TextStyle(
                            fontSize: screenWidth * 0.029,
                            color: AppColors.clr,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
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
