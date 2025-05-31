
import 'package:evently_plan/core/colors_maneger.dart';
import 'package:flutter/material.dart';


abstract class ThemesManegers {
  static ThemeData light = ThemeData(
    canvasColor: ColorsManager.white,
    primaryColor: ColorsManager.blue,
    secondaryHeaderColor: ColorsManager.white,
    indicatorColor: ColorsManager.white,
    cardColor: ColorsManager.white,
    focusColor: ColorsManager.blue,
    iconTheme: IconThemeData(color: ColorsManager.gray),
    useMaterial3: false,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.white,
      centerTitle: true,
      titleTextStyle:TextStyle(color: ColorsManager.blue,fontSize: 20),
        elevation: 0,
      iconTheme: IconThemeData(color: ColorsManager.blue)
    ),
    tabBarTheme: TabBarTheme(),
    scaffoldBackgroundColor: ColorsManager.white,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: ColorsManager.gray),
      contentPadding: EdgeInsets.all(16),
      constraints: BoxConstraints(maxHeight: 100),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorsManager.gray, width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorsManager.gray, width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorsManager.red, width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      prefixIconColor: ColorsManager.gray,
      suffixIconColor: ColorsManager.gray,
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: ColorsManager.blue),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      unselectedLabelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white,
    ),
    textTheme: TextTheme(
      //tabBar color text
      displayMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: ColorsManager.black,
      ),
      labelMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: ColorsManager.blue,
      ),
      // end
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: ColorsManager.white,
      ),
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: ColorsManager.white,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: ColorsManager.black,
      ),

      labelSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: ColorsManager.gray,
      ),
        bodySmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: ColorsManager.black,
        )
    ),
  );
  static ThemeData dark = ThemeData(
    primaryColor: ColorsManager.darkModePrime,
    secondaryHeaderColor: ColorsManager.darkModePrime,
    indicatorColor: ColorsManager.blue,
    focusColor: ColorsManager.white,
    iconTheme: IconThemeData(color: ColorsManager.white),
    useMaterial3: false,
    appBarTheme: AppBarTheme(
        backgroundColor: ColorsManager.darkModePrime,
        centerTitle: true,
        titleTextStyle:TextStyle(color: ColorsManager.blue,fontSize: 20),
        elevation: 0,
        iconTheme: IconThemeData(color: ColorsManager.blue)
    ),
    tabBarTheme: TabBarTheme(),
    cardColor: ColorsManager.darkModePrime,
    scaffoldBackgroundColor: ColorsManager.darkModePrime,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: ColorsManager.white),
      contentPadding: EdgeInsets.all(16),
      constraints: BoxConstraints(maxHeight: 100),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorsManager.blue, width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorsManager.blue, width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorsManager.red, width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      prefixIconColor: ColorsManager.gray,
      suffixIconColor: ColorsManager.gray,
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: ColorsManager.darkModePrime),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      unselectedLabelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white,
    ),
    canvasColor: ColorsManager.white,
    textTheme: TextTheme(
      //tabBar color text
      displayMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: ColorsManager.white,
      ),
      labelMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: ColorsManager.blue,
      ),
      // end
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: ColorsManager.white,
      ),
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: ColorsManager.white,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: ColorsManager.white,
      ),

      labelSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: ColorsManager.white,
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: ColorsManager.white,
      )
    ),
  );
}
