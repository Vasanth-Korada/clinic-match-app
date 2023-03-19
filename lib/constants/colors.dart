import 'package:flutter/material.dart';

/// This file contains all the colors used by the app.

class AppColors {
  AppColors._();

  // White Colors as per the XD design
  static const Color white = Color(0xFFFFFFFF);
  static const Color white95 = Color(0xF2FFFFFF);
  static const Color white87 = Color(0xDEFFFFFF);
  static const Color white80 = Color(0xCCFFFFFF);
  static const Color white38 = Colors.white38;
  static const Color white70 = Color(0xB3FFFFFF);
  static const Color white60 = Color(0x99FFFFFF);
  static const Color white50 = Color(0x80FFFFFF);
  static const Color white20 = Color(0x33FFFFFF);
  static const Color lGrey = Color(0xFFA0A4AD);
  static const Color ldGrey = Color(0xFFD7D9DC);

  // Black colors as per the XD design
  static const Color black = Color(0xFF000000);
  static const Color black16 = Color(0x29000000);
  static const Color blueBlack = Color(0xFF263238);

  static const Color lightShadeYellow = Color(0xff6b641E);

  static const Color cyan1 = Color(0xFFCCFFF1);
  static const Color lightBlue = Color(0xFFBBDEFB);
  static const Color lemon = Color(0xFFFCDC1B);
  static const Color smoke = Color(0xFFF6F6F6);
  static const Color eclipse = Color(0xFF3D3D3D);
  static const Color sharpBlack = Color(0xFF121212);
  static const Color coal = Color(0xFF292929);
  static const Color rainCloud = Color(0xFF8F8F8F);
  static const Color l170Grey = Color(0xFFC5C7CC);

  static const Color red = Color(0xFFFF0000);
  static const Color red100 = Color(0xFFff4d4d);
  static const Color errorRed = Color(0xFFFF6E6E);
  static const Color pureRed = Color(0xFFF54343);

  static const Color green = Color(0xFF4CAF50);
  static const Color flagGreen = Color(0xFF41AA39);
  static const Color strongCyanLimeGreen = Color(0xFF09D16B);
  static const Color aggressiveGreen = Color(0xFF69BBB9);
  static const Color growthPink = Color(0xFFFF91BB);
  static const Color moderateOrange = Color(0xFFF5865B);
  static const Color conservativeYellow = Color(0xFFFFD95C);

  static const Color navyBlue = Color(0xFF6FB0EA);
  static const Color flagBlue = Color(0xFF3875D2);
  static const Color spicyMango = Color(0xFFF27406);
  static const Color darkBlue = Color(0xFF101B31);
  static const Color lightGrey = Color(0xFF293B5D);
  static const Color lightGreyBorder = Color(0xFF49546A);
  static const Color l1Grey = Color(0xFF707070);
  static const Color tab1 = Color(0xFF1C2A46);
  static const Color tab2 = Color(0xFF293B5D);
  static const Color tab3 = Color(0xFF3B4E72);
  static const Color whaleBlue = Color(0xFF1A293D);
  static const Color bottomAppBarShadowColor = Color(0x334E7FE2);
  static const Color darkGrey = Color(0xFF242F47);

  // New Design Colors.
  static const Color blueTextColor = Color(0xFF6DBDFA);
  static const Color sliderBlue = Color(0xFF0F88F9);
  static const Color grey = Color(0xFFC4C4C4);
  static const LinearGradient buttonLinearGradient = LinearGradient(
    colors: <Color>[
      Color(0xFFFFBF00),
      Color(0xFFFFDA00),
    ],
  );
  static const LinearGradient buttonDisabledGradient = LinearGradient(
    colors: <Color>[
      Color(0xFF575422),
      Color(0xFF575422),
    ],
  );
  static const LinearGradient greyToBlueGradient = LinearGradient(
    colors: <Color>[
      grayishBlue,
      whaleBlue,
    ],
  );
  static const LinearGradient congratsLinearGradient = LinearGradient(
    colors: <Color>[
      Color(0xFFFF5183),
      Color(0xFF2B68F7),
      Color(0xFF47C5FF),
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  static const LinearGradient shareCardGradient = LinearGradient(
    begin: Alignment(0.5, 0.020),
    end: Alignment(0.5, 1),
    colors: <Color>[
      Color(0x00101b31),
      Color(0xff101b31),
    ],
  );

  static const LinearGradient debtFreeGoalsListGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      Color(0xFF111D35),
      Color(0xFF22345E),
      Color(0xFF2C4785),
      Color(0xFF192A50),
      Color(0xFF0C1E44),
      Color(0xFF0C1E44),
    ],
  );

  static const Color mediumLightShadeYellow = Color(0xFFFAE375);
  static const Color multiplYellow = Color(0xFFFFDA00);
  static const Color containerYellow = Color(0xFFFFD600);
  static const Color sunflowerYellow = Color(0xFFffc43f);
  static const Color brightYellow = Color(0xFFEEC230);

  static const List<Color> signInBackgroundColors = <Color>[
    Color(0xff152d5c),
    Color(0xff101b31),
  ];
  static const Color profileDashBoardBG = Color(0xFF030B1A);
  static const Color greenStrongCyan = Color(0xFF0AB963);
  static const Color popUpMenuGrayColor = Color(0xFFEEEEEE);
  static const Color lightGrayishBlue = Color(0xFFE4E9F5);
  static const Color borderColor = Color(0xFF9EA2AB);
  static const Color grayishBlue = Color(0xFFBEC1C7);
  static const Color darkGrayishBlue = Color(0xFF9FA3AC);
  static const Color veryDarkGrayishBlue = Color(0x61434e64);
  static const Color softPink = Color(0xfff66e9c);
  static const Color veryDarkDesaturatedBlue = Color(0xFF263149);
  static const Color bottomSheetColor = Color(0xFF1A2640);
  static const Color veryDarkBlue = Color(0xFF0B1221);
  static const LinearGradient statsCardGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[
      Color(0xFF172747),
      Color(0x802D3B59),
    ],
  );
  static const Color silver = Color(0xFFC0C0C0);
  static const Color veryLightGray = Color(0xFFEAEAEA);
  static const Color veryDarkGray = Color(0xFF525252);
  static const Color darkCyan = Color(0xFF118C7E);
  static const Color pink = Color(0xFFBC06A0);
  static const Color antiFlashWhite = Color(0xFFF1F1F1);
  static const Color silverSand = Color(0xFFBCC0C6);
  static const Color bronzeOlive = Color(0xFF575422);
  static const Color veryDarkBlueDiwaliTheme = Color(0xFF0E014D);
}
