// import 'package:flutter_localization/flutter_localization.dart';

// const List<MapLocale> LOCALES = [
//   MapLocale('en', LocalData.EN),
//   MapLocale('es', LocalData.ES),
//   MapLocale('zh', LocalData.ZH),
// ];

// mixin LocalData {
//   static const String title = 'title';
//   static const String body = 'body';
//   static const String text = 'text';
//   static const String text1 = 'text1';
//   static const String onboardingBtn = 'onboardingBtn';
//   static const String SubscriptionText = 'SubscriptionText';
//   static const String Instructions = 'Instructions';

//   static const Map<String, dynamic> EN = {
//     'title': "Welcome",
//     'body': 'Find Your',
//     'text': 'Ice Breaker\nQuestions',
//     'text1': 'To Know More About Your Partner.',
//     'onboardingBtn': 'Play as Guest Player',
//     'SubscriptionText': 'Subscribe \$4.99 Full Access 50 Questions',
//     'Instructions': 'Instructions:',
//   };

//   static const Map<String, dynamic> ES = {
//     'title': 'Bienvenido',
//     'body': 'Finden Sie Ihr',
//     'text': 'Preguntas para romper\nel hielo',
//     'text1': 'Para conocer más sobre tu pareja.',
//     'onboardingBtn': 'Jugar como jugador invitado',
//     'SubscriptionText': 'Suscríbete por \$4.99 Acceso completo a 50 preguntas',
//     'Instructions': 'Instrucciones:',
//   };

//   static const Map<String, dynamic> ZH = {
//     'title': "欢迎 ",
//     'body': '找到你的',
//     'text': '破冰问题',
//     'text1': '了解更多关于你的伴侣。',
//     'onboardingBtn': '以访客身份游戏',
//     'SubscriptionText': '订阅 \$4.99 获取50个问题的完全访问',
//     'Instructions': '说明:',
//   };
// }

import 'package:flutter/material.dart';

class MapLocale {
  final String languageCode;
  final Map<String, String> translations;

  MapLocale(this.languageCode, this.translations);
}

class LocalData {
  static const String title = 'title';
  // static const String body = 'body';
  static const String btn = 'Next';
  static const String SubscriptionText = 'SubscriptionText';
  static const String onboardingBtn = 'onboardingBtn';
  static const String Instructions = 'Instructions';
  static const String InstructionDes = 'InstructionDes';
  static const String InstructionDes2 = 'InstructionDes2';
  static const String StartGame = 'StartGame';
  static const String OpenEnded = 'OpenEnded';
  static const String Questions = 'Questions';

  static const Map<String, String> EN = {
    'title': "Welcome",
    // 'body': 'Find Your Partner',
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
  };

  static const Map<String, String> ES = {
    'title': 'Bienvenido',
    // 'body': 'Encuentra tu pareja',
    'btn': 'Siguiente',
    'SubscriptionText': 'Suscríbete por \$4.99 Acceso completo a 50 preguntas',
    'onboardingBtn': 'Jugar como jugador invitado',
    'Instructions': 'Instrucciones:',
    'InstructionDes':
        "• 2 jugadores se turnan para sacar una carta y responder preguntas abiertas. El objetivo del juego es conocer mejor a la otra persona. Esto no es trivia, y no hay respuestas incorrectas.\n\n",
    'InstructionDes2':
        "• Por favor, utiliza las preguntas para iniciar conversaciones. Los jugadores pueden establecer un límite de tiempo de 1 hora, o no establecer ningún límite. Pueden preguntar '¿Por qué?' a la respuesta del otro jugador en cualquier momento.",
    'StartGame': "Iniciar Juego",
    'OpenEnded': "De respuesta abierta",
    'Questions': "Preguntas"
  };

  static const Map<String, String> ZH = {
    'title': "欢迎",
    // 'body': '找到你的伴侣',
    'btn': '下一个',
    'SubscriptionText': '订阅 \$4.99 获取50个问题的完全访问',
    'onboardingBtn': '以访客身份游戏',
    'Instructions': '说明:',
    'InstructionDes': '• 2名玩家轮流抽取卡片并回答开放式问题。游戏的目的是更好地了解对方。这不是问答游戏，没有错误的答案。\n\n',
    'InstructionDes2': '• 请使用这些问题来开启对话。玩家可以设置1小时的时间限制，或不设置限制。可以随时询问对方的答案“为什么？”',
    'StartGame': '开始游戏',
    'OpenEnded': '开放式',
    'Questions': '问题'
  };
}

final List<MapLocale> LOCALES = [
  MapLocale('en', LocalData.EN),
  MapLocale('es', LocalData.ES),
  MapLocale('zh', LocalData.ZH),
];
