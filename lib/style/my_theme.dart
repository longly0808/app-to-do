import 'package:flutter/material.dart';
import 'package:to_do_list/style/dimens.dart';
import 'colors.dart';

class MyTheme{
  static const String fontFamilyMontserrat = 'monsterrat';
  static const String fontFamilyBeBasNeuE = 'bebasNeue';

  static const bool _isLightMode = true;
  static bool get isLightMode => _isLightMode;

  static ThemeData lightTheme(){
    return ThemeData(
      primaryColor: MyColors.primaryColor,
      backgroundColor: MyColors.backgroundColor,
      dividerColor: MyColors.greyColor,
      primaryColorDark: MyColors.blackColor,
      colorScheme:  const ColorScheme(
        secondary: MyColors.accentColor,
        primary: MyColors.primaryColor,
        background: MyColors.backgroundColor,
        brightness: Brightness.light,
        error: MyColors.errorColor,
        onBackground: MyColors.greyColor,
        onError: MyColors.errorColor,
        onPrimary: MyColors.accentColor,
        onSecondary: MyColors.lightColor,
        onSurface: MyColors.whiteColor,
        primaryContainer: MyColors.whiteColor,
        secondaryContainer: MyColors.activeColor,
        surface: MyColors.defaultColor,

      ) ,
      textTheme:const TextTheme(
        headline1: TextStyle(
          color: MyColors.primaryColor,
         fontFamily: fontFamilyBeBasNeuE,
          fontSize: Dimens.textSize73,
          fontWeight: FontWeight.w400,
        ),
        headline2: TextStyle(
          color: MyColors.primaryColor,
          fontFamily: fontFamilyBeBasNeuE,
          fontSize: Dimens.textSize45,
          fontWeight: FontWeight.w400,
        ),
        headline3: TextStyle(
          color: MyColors.primaryColor,
          fontFamily: fontFamilyBeBasNeuE,
          fontSize: Dimens.textSize36,
          fontWeight: FontWeight.w400,
        ),
        headline4: TextStyle(
          color: MyColors.primaryColor,
          fontFamily: fontFamilyBeBasNeuE,
          fontSize: Dimens.textSize26,
          fontWeight: FontWeight.w400,
        ),
        headline5:TextStyle(
          color: MyColors.primaryColor,
          fontFamily: fontFamilyMontserrat,
          fontSize: Dimens.textSize14,
        ) ,
        bodyText1:TextStyle(
          color: MyColors.primaryColor,
          fontFamily: fontFamilyMontserrat,
          fontSize: Dimens.textSize16,
        ),
        bodyText2: TextStyle(
          color: MyColors.primaryColor,
          fontFamily: fontFamilyMontserrat,
          fontSize: Dimens.textSize14,
        ),
        subtitle1: TextStyle(
          color: MyColors.primaryColor,
          fontFamily: fontFamilyMontserrat,
          fontSize: Dimens.textSize12,
        ),
        button: TextStyle(
          color: MyColors.whiteColor,
          fontFamily: fontFamilyMontserrat,
          fontSize: Dimens.textSize14,
          fontWeight: FontWeight.w500,
        ),
      )

    );
  }
  static ThemeData darkTheme(){
    return ThemeData(
      backgroundColor: MyColors.darkColor,
        primaryColor: MyColors.darkCloudColor,
        scaffoldBackgroundColor: MyColors.darkColor,
        primaryColorDark: MyColors.lightColor,
        colorScheme:  const ColorScheme(
          secondary: MyColors.darkAccentColor,
          primary: MyColors.darkCloudColor,
          background: MyColors.darkColor,
          brightness: Brightness.dark,
          error: MyColors.errorColor,
          onBackground: MyColors.whiteColor,
          onError: MyColors.errorColor,
          onPrimary: MyColors.darkAccentColor,
          onSecondary: MyColors.lightColor,
          onSurface: MyColors.darkColor,
          primaryContainer: MyColors.defaultColor,
          secondaryContainer: MyColors.darkCloudColor,
          surface: MyColors.defaultColor,
        ) ,
        textTheme:const TextTheme(
          headline1: TextStyle(
            color: MyColors.whiteColor,
            fontFamily: fontFamilyBeBasNeuE,
            fontSize: Dimens.textSize73,
            fontWeight: FontWeight.w400,
          ),
          headline2: TextStyle(
            color: MyColors.whiteColor,
            fontFamily: fontFamilyBeBasNeuE,
            fontSize: Dimens.textSize45,
            fontWeight: FontWeight.w400,
          ),
          headline3: TextStyle(
            color: MyColors.whiteColor,
            fontFamily: fontFamilyBeBasNeuE,
            fontSize: Dimens.textSize36,
            fontWeight: FontWeight.w400,
          ),
          headline4: TextStyle(
            color: MyColors.whiteColor,
            fontFamily: fontFamilyBeBasNeuE,
            fontSize: Dimens.textSize26,
            fontWeight: FontWeight.w400,
          ),
          headline5:TextStyle(
            color: MyColors.whiteColor,
            fontFamily: fontFamilyMontserrat,
            fontSize: Dimens.textSize14,
          ) ,
          bodyText1:TextStyle(
            color: MyColors.whiteColor,
            fontFamily: fontFamilyMontserrat,
            fontSize: Dimens.textSize16,
          ),
          bodyText2: TextStyle(
            color: MyColors.whiteColor,
            fontFamily: fontFamilyMontserrat,
            fontSize: Dimens.textSize14,
          ),
          subtitle1: TextStyle(
            color: MyColors.whiteColor,
            fontFamily: fontFamilyMontserrat,
            fontSize: Dimens.textSize12,
          ),
          button: TextStyle(
            color: MyColors.whiteColor,
            fontFamily: fontFamilyMontserrat,
            fontSize: Dimens.textSize14,
            fontWeight: FontWeight.w500,
          ),
        )
    );
  }



}