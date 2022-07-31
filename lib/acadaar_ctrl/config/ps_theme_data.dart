import 'package:flutter/cupertino.dart';
import 'package:zlga/acadaar_ctrl/config/ps_colors.dart';
import 'package:flutter/material.dart';

import 'dr_config.dart';

ThemeData themeData(ThemeData baseTheme) {
  //final baseTheme = ThemeData.light();

  if (baseTheme.brightness == Brightness.dark) {
    PsColors.loadColor2(false);

    // Dark Theme
    return baseTheme.copyWith(
      primaryColor: PsColors.mainColor,
      primaryColorDark: PsColors.mainDarkColor,
      primaryColorLight: PsColors.mainLightColor,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: PsColors.black,//thereby
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
            color: PsColors.textPrimaryColor,
            fontFamily: DrConfig.dr_default_font_family),
        headline2: TextStyle(
            color: PsColors.textPrimaryColor,
            fontFamily: DrConfig.dr_default_font_family),
        headline3: TextStyle(
            color: PsColors.textPrimaryColor,
            fontFamily: DrConfig.dr_default_font_family),
        headline4: TextStyle(
          color: PsColors.textPrimaryColor,
          fontFamily: DrConfig.dr_default_font_family,
        ),
        headline5: TextStyle(
            color: PsColors.textPrimaryColor,
            fontFamily: DrConfig.dr_default_font_family,
            fontWeight: FontWeight.bold),
        headline6: TextStyle(
            color: PsColors.textPrimaryColor,
            fontFamily: DrConfig.dr_default_font_family),
        subtitle1: TextStyle(
            color: PsColors.textPrimaryColor,
            fontFamily: DrConfig.dr_default_font_family,
            fontWeight: FontWeight.bold),
        subtitle2: TextStyle(
            color: PsColors.textPrimaryColor,
            fontFamily: DrConfig.dr_default_font_family,
            fontWeight: FontWeight.bold),
        bodyText1: TextStyle(
          color: PsColors.textPrimaryColor,
          fontFamily: DrConfig.dr_default_font_family,
        ),
        bodyText2: TextStyle(
            color: PsColors.textPrimaryColor,
            fontFamily: DrConfig.dr_default_font_family,
            fontWeight: FontWeight.bold),
        button: TextStyle(
            color: PsColors.textPrimaryColor,
            fontFamily: DrConfig.dr_default_font_family),
        caption: TextStyle(
            color: PsColors.textPrimaryLightColor,
            fontFamily: DrConfig.dr_default_font_family),
        overline: TextStyle(
            color: PsColors.textPrimaryColor,
            fontFamily: DrConfig.dr_default_font_family),
      ),
      iconTheme: IconThemeData(color: PsColors.iconColor),
      appBarTheme: AppBarTheme(color: PsColors.coreBackgroundColor),
    );
  } else {
    PsColors.loadColor2(true);
    // White Theme
    return baseTheme.copyWith(
        primaryColor: PsColors.mainColor,
        primaryColorDark: PsColors.mainDarkColor,
        primaryColorLight: PsColors.mainLightColor,
        textTheme: TextTheme(
          headline1: TextStyle(
              color: PsColors.textPrimaryColor,
              fontFamily: DrConfig.dr_default_font_family),
          headline2: TextStyle(
              color: PsColors.textPrimaryColor,
              fontFamily: DrConfig.dr_default_font_family),
          headline3: TextStyle(
              color: PsColors.textPrimaryColor,
              fontFamily: DrConfig.dr_default_font_family),
          headline4: TextStyle(
            color: PsColors.textPrimaryColor,
            fontFamily: DrConfig.dr_default_font_family,
          ),
          headline5: TextStyle(
              color: PsColors.textPrimaryColor,
              fontFamily: DrConfig.dr_default_font_family,
              fontWeight: FontWeight.bold),
          headline6: TextStyle(
              color: PsColors.textPrimaryColor,
              fontFamily: DrConfig.dr_default_font_family),
          subtitle1: TextStyle(
              color: PsColors.textPrimaryColor,
              fontFamily: DrConfig.dr_default_font_family,
              fontWeight: FontWeight.bold),
          subtitle2: TextStyle(
              color: PsColors.textPrimaryColor,
              fontFamily: DrConfig.dr_default_font_family,
              fontWeight: FontWeight.bold),
          bodyText1: TextStyle(
            color: PsColors.textPrimaryColor,
            fontFamily: DrConfig.dr_default_font_family,
          ),
          bodyText2: TextStyle(
              color: PsColors.textPrimaryColor,
              fontFamily: DrConfig.dr_default_font_family,
              fontWeight: FontWeight.bold),
          button: TextStyle(
              color: PsColors.textPrimaryColor,
              fontFamily: DrConfig.dr_default_font_family),
          caption: TextStyle(
              color: PsColors.textPrimaryLightColor,
              fontFamily: DrConfig.dr_default_font_family),
          overline: TextStyle(
              color: PsColors.textPrimaryColor,
              fontFamily: DrConfig.dr_default_font_family),
        ),
        iconTheme: IconThemeData(color: PsColors.iconColor),
        appBarTheme: AppBarTheme(color: PsColors.coreBackgroundColor));
  }
}


CupertinoThemeData iOSTheme(CupertinoThemeData baseTheme) {
  //final baseTheme = ThemeData.light();

  if (baseTheme.brightness == Brightness.dark) {
    PsColors.loadColor2(false);

    // Dark Theme
    return baseTheme.copyWith(
      primaryColor: PsColors.mainColor,
      barBackgroundColor: PsColors.mainDarkColor,
      scaffoldBackgroundColor: PsColors.mainLightColor,
      textTheme: CupertinoTextThemeData(
        textStyle: TextStyle(
            color: PsColors.textPrimaryColor,
            fontFamily: DrConfig.dr_default_font_family),
        actionTextStyle: TextStyle(
            color: PsColors.textPrimaryColor,
            fontFamily: DrConfig.dr_default_font_family),
        tabLabelTextStyle: TextStyle(
            color: PsColors.textPrimaryColor,
            fontFamily: DrConfig.dr_default_font_family),
        navTitleTextStyle: TextStyle(
          color: PsColors.textPrimaryColor,
          fontFamily: DrConfig.dr_default_font_family,
        ),
        navLargeTitleTextStyle: TextStyle(
            color: PsColors.textPrimaryColor,
            fontFamily: DrConfig.dr_default_font_family,
            fontWeight: FontWeight.bold),
        navActionTextStyle: TextStyle(
            color: PsColors.textPrimaryColor,
            fontFamily: DrConfig.dr_default_font_family),
        pickerTextStyle: TextStyle(
            color: PsColors.textPrimaryColor,
            fontFamily: DrConfig.dr_default_font_family,
            fontWeight: FontWeight.bold),
        dateTimePickerTextStyle: TextStyle(
            color: PsColors.textPrimaryColor,
            fontFamily: DrConfig.dr_default_font_family,
            fontWeight: FontWeight.bold),
      ),

    );
  } else {
    PsColors.loadColor2(true);
    // White Theme
    return baseTheme.copyWith(
      primaryColor: PsColors.mainColor,
      barBackgroundColor: PsColors.mainDarkColor,
      scaffoldBackgroundColor: PsColors.mainLightColor,
      textTheme: CupertinoTextThemeData(
        textStyle: TextStyle(
            color: PsColors.textPrimaryColor,
            fontFamily: DrConfig.dr_default_font_family),
        actionTextStyle: TextStyle(
            color: PsColors.textPrimaryColor,
            fontFamily: DrConfig.dr_default_font_family),
        tabLabelTextStyle: TextStyle(
            color: PsColors.textPrimaryColor,
            fontFamily: DrConfig.dr_default_font_family),
        navTitleTextStyle: TextStyle(
          color: PsColors.textPrimaryColor,
          fontFamily: DrConfig.dr_default_font_family,
        ),
        navLargeTitleTextStyle: TextStyle(
            color: PsColors.textPrimaryColor,
            fontFamily: DrConfig.dr_default_font_family,
            fontWeight: FontWeight.bold),
        navActionTextStyle: TextStyle(
            color: PsColors.textPrimaryColor,
            fontFamily: DrConfig.dr_default_font_family),
        pickerTextStyle: TextStyle(
            color: PsColors.textPrimaryColor,
            fontFamily: DrConfig.dr_default_font_family,
            fontWeight: FontWeight.bold),
        dateTimePickerTextStyle: TextStyle(
            color: PsColors.textPrimaryColor,
            fontFamily: DrConfig.dr_default_font_family,
            fontWeight: FontWeight.bold),
      ),

    );
  }
}
