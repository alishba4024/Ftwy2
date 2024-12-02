import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ftwy2/splashscreen.dart';

void main() async {
  // Initialize GetStorage
  await GetStorage.init();

  // Check if a language is already saved; if not, set English ('en') as default
  final storage = GetStorage();
  String savedLanguage = storage.read('languageCode') ?? 'en';
  storage.write(
      'languageCode', savedLanguage); // Ensure it's saved if not already

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Read the saved language
    String languageCode = GetStorage().read('languageCode') ?? 'en';

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Localization',
      translations: MyTranslations(), // Set up translations
      locale: Locale(languageCode), // Use stored language or default to English
      fallbackLocale: Locale('en'), // Fallback locale
      home: const Splashscreen(),
    );
  }
}

// Translations for dynamic locale change
class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys {
    return {
      'en': {
        'title': 'Welcome',
        'body': 'Find Your Partner',
        'btn': 'Next',
        'SubscriptionText': 'Subscribe \$4.99 Full Access 50 Questions',
        'onboardingBtn': 'Play as Guest Player',
        'Instructions': 'Instructions:',
        'InstructionDes':
            '• 2 players take turns drawing a card and answering open-ended questions. Object of the game is to get to know the other person better. This is not trivia, and there are no wrong answers.\n\n',
        'InstructionDes2':
            '• Please use the questions to springboard conversations. Players can set a time limit of 1 hour, or not set a limit. Can ask "Why?" of other player\'s answer at any time.',
        'StartGame': 'Start Game',
        'OpenEnded': 'Open Ended',
        'Questions': 'Questions'
      },
      'es': {
        'title': 'Bienvenido',
        'body': 'Encuentra tu pareja',
        'btn': 'Siguiente',
        'SubscriptionText':
            'Suscríbete por \$4.99 Acceso completo a 50 preguntas',
        'onboardingBtn': 'Jugar como jugador invitado',
        'Instructions': 'Instrucciones:',
        'InstructionDes':
            "• 2 jugadores se turnan para sacar una carta y responder preguntas abiertas. El objetivo del juego es conocer mejor a la otra persona. Esto no es trivia, y no hay respuestas incorrectas.\n\n",
        'InstructionDes2':
            "• Por favor, utiliza las preguntas para iniciar conversaciones. Los jugadores pueden establecer un límite de tiempo de 1 hora, o no establecer ningún límite. Pueden preguntar '¿Por qué?' a la respuesta del otro jugador en cualquier momento.",
        'StartGame': "Iniciar Juego",
        'OpenEnded': "De respuesta abierta",
        'Questions': "Preguntas"
      },
      'zh': {
        'title': '欢迎',
        'body': '找到你的伴侣',
        'btn': '下一个',
        'SubscriptionText': '订阅 \$4.99 获取50个问题的完全访问',
        'onboardingBtn': '以访客身份游戏',
        'Instructions': '说明:',
        'InstructionDes':
            '• 2名玩家轮流抽取卡片并回答开放式问题。游戏的目的是更好地了解对方。这不是问答游戏，没有错误的答案。\n\n',
        'InstructionDes2':
            '• 请使用这些问题来开启对话。玩家可以设置1小时的时间限制，或不设置限制。可以随时询问对方的答案“为什么？”',
        'StartGame': '开始游戏',
        'OpenEnded': '开放式',
        'Questions': '问题'
      },
    };
  }
}
