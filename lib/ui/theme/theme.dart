import 'package:flutter/material.dart';

class AppColors {
  static const Color brandPrimary = Color(0xFFC2410C);
  static const Color brandSecondary = Color(0xFFEA580C);
  static const Color brandLight = Color(0xFFFED7AA);
  static const Color brandLighter = Color(0xFFFFEDD5);
  static const Color brandLightest = Color(0xFFFFF7ED);
  static const Color brandDark = Color(0xFF9A3412);
  static const Color brandFaded = Color(0xFFFDBA74);

  static const Color textDark = Color(0xFF181D27);
  static const Color textMedium = Color(0xFF414651);
  static const Color textLight = Color(0xFF535862);
  static const Color textDisabled = Color(0xFFA4A7AE);
  static const Color textMuted = Color(0xFF717680);

  static const Color white = Color(0xFFFFFFFF);
  static const Color offWhite = Color(0xFFFDFDFD);
  static const Color grayBackground = Color(0xFFFAFAFA);
  static const Color grayLight = Color(0xFFF5F5F5);
  static const Color border = Color(0xFFE9EAEB);
  static const Color borderLight = Color(0xFFD5D7DA);

  static const Color successBase = Color(0xFF039855);
  static const Color successLight = Color(0xFFD1FADF);
  static const Color successLightest = Color(0xFFECFDF3);

  static const Color neutralBlack = Color(0xFF0A0A0A);
}

class AppTextStyles {
  static const String fontFamily = 'Inter';

  static const TextStyle displayLg = TextStyle(
    fontFamily: fontFamily,
    fontSize: 30,
    fontWeight: FontWeight.w600,
    height: 38 / 30,
    color: AppColors.textDark,
  );

  static const TextStyle displayMd = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 32 / 24,
    color: AppColors.textDark,
  );

  static const TextStyle headingLg = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 30 / 20,
    color: AppColors.textDark,
  );

  static const TextStyle headingMd = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 24 / 16,
    color: AppColors.textDark,
  );

  static const TextStyle bodyMd = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 24 / 16,
    color: AppColors.textDark,
  );

  static const TextStyle bodySm = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 20 / 14,
    color: AppColors.textLight,
  );

  static const TextStyle bodySmSemibold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 20 / 14,
    color: AppColors.textDark,
  );

  static const TextStyle bodyXs = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 18 / 12,
    color: AppColors.textLight,
  );

  static const TextStyle bodyXsMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 18 / 12,
    color: AppColors.textMedium,
  );

  static const TextStyle buttonLabel = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 24 / 16,
    color: AppColors.white,
  );

  static const TextStyle buttonLabelSm = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 20 / 14,
    color: AppColors.white,
  );
}

class AppRadius {
  static const double card = 16;
  static const double sheet = 24;
  static const double iconContainer = 20;
  static const double badge = 16;
  static const double pill = 9999;
}

class AppShadows {
  static const List<BoxShadow> sheet = [
    BoxShadow(
      color: Color(0x140A0D12),
      offset: Offset(0, -12),
      blurRadius: 16,
      spreadRadius: -4,
    ),
    BoxShadow(
      color: Color(0x080A0D12),
      offset: Offset(0, -4),
      blurRadius: 6,
      spreadRadius: -2,
    ),
  ];

  static const List<BoxShadow> card = [
    BoxShadow(
      color: Color(0x140A0D12),
      offset: Offset(0, 12),
      blurRadius: 16,
      spreadRadius: -4,
    ),
    BoxShadow(
      color: Color(0x080A0D12),
      offset: Offset(0, 4),
      blurRadius: 6,
      spreadRadius: -2,
    ),
  ];

  static const List<BoxShadow> button = [
    BoxShadow(
      color: Color(0x0D0A0D12),
      offset: Offset(0, 1),
      blurRadius: 2,
      spreadRadius: 0,
    ),
  ];
}

final ThemeData appTheme = ThemeData(
  fontFamily: AppTextStyles.fontFamily,
  scaffoldBackgroundColor: AppColors.white,
  primaryColor: AppColors.brandPrimary,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.brandPrimary,
    primary: AppColors.brandPrimary,
  ),
);