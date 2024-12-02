import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ftwy2/onboarding.dart';
import 'package:ftwy2/colors_constants.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  final GetStorage storage = GetStorage();
  late String _selectedLanguage;

  @override
  void initState() {
    super.initState();
    _selectedLanguage = storage.read('languageCode') ?? 'en';
    Get.updateLocale(
        Locale(_selectedLanguage)); // Ensure app starts with saved language
  }

  void _changeLanguage(String? languageCode) {
    if (languageCode != null) {
      setState(() {
        _selectedLanguage = languageCode;
        Get.updateLocale(Locale(languageCode));
        storage.write('languageCode', languageCode); // Save selected language
      });
    }
  }

  void _navigateToNextScreen() {
    Get.off(() => const Onboarding());
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background
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

          // Centered content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Container(
                  height: screenHeight * 0.3,
                  width: screenWidth * 0.7,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                // Welcome text
                Text(
                  'title'.tr, // Localized title
                  style: TextStyle(
                    fontSize: screenWidth * 0.08,
                    fontWeight: FontWeight.bold,
                    color: AppColors.clr,
                  ),
                ),

                // Language Dropdown
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: () async {
                      final selectedLanguage = await showMenu<String>(
                        context: context,
                        position: RelativeRect.fromLTRB(
                          screenWidth * 0.5 - 90, // Center horizontally
                          screenHeight * 0.7, // Slightly below current position
                          screenWidth * 0.2,
                          0,
                        ),
                        items: [
                          const PopupMenuItem(
                            value: 'en',
                            child: Text('English'),
                          ),
                          const PopupMenuItem(
                            value: 'es',
                            child: Text('Español'),
                          ),
                          const PopupMenuItem(
                            value: 'zh',
                            child: Text('中国人'),
                          ),
                        ],
                      );

                      if (selectedLanguage != null) {
                        _changeLanguage(selectedLanguage);
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _selectedLanguage.toUpperCase(),
                          style: TextStyle(fontSize: 16, color: AppColors.clr),
                        ),
                        const SizedBox(width: 7),
                        Icon(
                          Icons.language,
                          color: AppColors.clr,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // "Next" button
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.1,
                vertical: screenHeight * 0.05,
              ),
              child: ElevatedButton(
                onPressed: _navigateToNextScreen,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.btnclr,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                  minimumSize: Size(screenWidth * 0.8, 40),
                ),
                child: Text(
                  'btn'.tr, // Localized button text
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.045,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
