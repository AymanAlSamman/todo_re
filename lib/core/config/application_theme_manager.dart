import 'package:flutter/material.dart';

class ApplicationThemeManager {
  static const primaryColor = Color(0xff5D9CEC);

//Light Mode ****************************
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: const Color(0xffDFECDB),

    //App Bar ***********************************
    appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        toolbarHeight: 120,
        iconTheme: IconThemeData(
          color: Colors.white,
        )),

    //BottomNavigator Bar ***********************************
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: primaryColor,
      unselectedItemColor: Color(0xffC8C9CB),
      selectedIconTheme: IconThemeData(
        color: primaryColor,
        size: 38,
      ),
      unselectedIconTheme: IconThemeData(
        color: Color(0xffC8C9CB),
        size: 30,
      ),
    ),

    // ********** floating Action Button *****************
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
        side: const BorderSide(
          color: Colors.white,
          width: 2.5,
        ),
      ),
    ),

    // ********** bottom AppBar Theme *****************
    bottomAppBarTheme: const BottomAppBarTheme(
      padding: EdgeInsets.zero,
      elevation: 0,
    ),

    //Text Style *******************************
    textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontFamily: "Poppins",
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyLarge: TextStyle(
          fontFamily: "Poppins",
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        bodyMedium: TextStyle(
          fontFamily: "Poppins",
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        bodySmall: TextStyle(
          fontFamily: "Poppins",
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        )),
  );

//-------------------------------------------------------------------

// Dark Mode ****************************

  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: const Color(0xff060E1E),

    //App Bar ***********************************
    appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        toolbarHeight: 120,
        iconTheme: IconThemeData(
          color: Colors.white,
        )),

    //BottomNavigator Bar ***********************************
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: primaryColor,
      unselectedItemColor: Color(0xffC8C9CB),
      selectedIconTheme: IconThemeData(
        color: primaryColor,
        size: 38,
      ),
      unselectedIconTheme: IconThemeData(
        color: Color(0xffC8C9CB),
        size: 30,
      ),
    ),

    // ********** floating Action Button *****************
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
        side: const BorderSide(
          color: Color(0xff141922),
          width: 2.5,
        ),
      ),
    ),

    // ********** bottom AppBar Theme *****************
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Color(0xff141922),
      padding: EdgeInsets.zero,
      elevation: 0,
    ),

    //Text Style *******************************
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
    ),
  );
}
