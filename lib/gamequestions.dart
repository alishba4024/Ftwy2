import 'package:flutter/material.dart';
import 'package:ftwy2/colors_constants.dart';
import 'package:ftwy2/endgamescreen.dart';
import 'package:get/get.dart';

class Gamequestions extends StatefulWidget {
  const Gamequestions({super.key});

  @override
  State<Gamequestions> createState() => _GamequestionsState();
}

class _GamequestionsState extends State<Gamequestions> {
  // Default questions list (English)
  final List<String> questions = [
    'What goals\nare you looking\nfor in a\nRelationship?',
    'What food\ndo you enjoy most?',
    'What kind of car do you like most?',
    'What qualities do you value in a friendship?',
    'What is your favorite color?',
  ];

  // Spanish questions list
  final List<String> es = [
    "¿Qué metas buscas en una relación?",
    "¿Qué comida disfrutas más?",
    "¿Qué tipo de coche te gusta más?",
    "¿Qué cualidades valoras en una amistad?",
    '¿Cuál es tu color favorito?'
  ];

  // Chinese questions list
  final List<String> zh = [
    '你在一段关系中寻求什么目标？',
    '你最喜欢什么食物？',
    '你最喜欢什么类型的车？',
    '你在友谊中看重哪些品质？',
    '你最喜欢的颜色是什么？'
  ];

  final PageController _pageController = PageController();

  List<String> _currentQuestions = []; // To hold the current set of questions

  @override
  void initState() {
    super.initState();
    // Initialize the question list based on the current locale
    _updateQuestionsList();
  }

  // Method to update the question list based on the current locale
  void _updateQuestionsList() {
    String currentLang = Get.locale?.languageCode ?? 'en';

    if (currentLang == 'es') {
      _currentQuestions = es;
    } else if (currentLang == 'zh') {
      _currentQuestions = zh;
    } else {
      _currentQuestions = questions;
    }
    setState(() {});
  }

  void _nextQuestion() {
    if (_pageController.page!.toInt() < _currentQuestions.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to Endgamescreen if this is the last question
      Get.to(() => Endgamescreen());
    }
  }

  void _previousQuestion() {
    if (_pageController.page!.toInt() > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeclr,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
              size: screenWidth * 0.08,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background pattern
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

          // Title
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.06, top: screenHeight * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'OpenEnded'.tr,
                  style: TextStyle(
                    fontFamily: 'Schyler',
                    fontSize: screenWidth * 0.06,
                  ),
                ),
                Text(
                  'Questions'.tr,
                  style: TextStyle(
                    fontFamily: 'Schyler',
                    fontSize: screenWidth * 0.1,
                  ),
                ),
              ],
            ),
          ),

          // Carousel-like Question Slider
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.09),
            child: Center(
              child: SizedBox(
                height: screenHeight * 0.5,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _currentQuestions.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(27),
                          border: Border.all(
                            color: Colors.red,
                            width: 4,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            _currentQuestions[index],
                            style: TextStyle(
                              fontSize: screenWidth * 0.09,
                              fontFamily: 'Schyler',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          // Bottom buttons
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.03),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back Button
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: ElevatedButton(
                        onPressed: _previousQuestion,
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: EdgeInsets.all(screenWidth * 0.04),
                          backgroundColor: AppColors.btnclr,
                        ),
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.white,
                          size: screenWidth * 0.07,
                        ),
                      ),
                    ),

                    // Next Button and Subscribe Text
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            onPressed: _nextQuestion,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.btnclr,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.02,
                              ),
                              minimumSize: Size(screenWidth * 0.6, 40),
                              elevation: 3,
                            ),
                            child: Text(
                              'Next Question',
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
                                fontSize: 11,
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
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
