import 'package:flutter/material.dart';

Map<int, Color> color(int r, int g, int b) {
  return {
    50: Color.fromRGBO(r, g, b, .1),
    100: Color.fromRGBO(r, g, b, .2),
    200: Color.fromRGBO(r, g, b, .3),
    300: Color.fromRGBO(r, g, b, .4),
    400: Color.fromRGBO(r, g, b, .5),
    500: Color.fromRGBO(r, g, b, .6),
    600: Color.fromRGBO(r, g, b, .7),
    700: Color.fromRGBO(r, g, b, .8),
    800: Color.fromRGBO(r, g, b, .9),
    900: Color.fromRGBO(r, g, b, 1),
  };
}

MaterialColor primaryColorLight = MaterialColor(
  0xFF73ABFF,
  color(115, 171, 255),
);
MaterialColor primaryColorDark = MaterialColor(
  0xffAD06EF,
  color(173, 6, 239),
);

class AppTheme {
  static TextTheme textThemeLight = const TextTheme(
    bodyText1: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Color(0xff767676),
    ),
    bodyText2: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: Color(0xff767676),
    ),
    headline1: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w600,
    ),
    headline3: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w500,
    ),
  );

  static InputDecorationTheme inputDecorationThemeLight = InputDecorationTheme(
    // enabledBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.red),
    ),

    hintStyle: const TextStyle(color: Color(0xffA9A9A9)),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        width: 1,
        color: primaryColorLight,
      ),
    ),

    contentPadding: const EdgeInsets.fromLTRB(30, 20, 20, 20),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 1,
        color: Color(0xffDFDFDF),
      ),
    ),
  );

  static final outlinedButtonThemeLight = OutlinedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.resolveWith(
        (states) => const TextStyle(color: Colors.black),
      ),
      shape: MaterialStateProperty.resolveWith(
        (states) => RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    ),
  );
  static final chipThemeLight = ChipThemeData(
    backgroundColor: Colors.white,
    disabledColor: Colors.grey,
    selectedColor: primaryColorLight.shade300,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
      side: const BorderSide(color: Color(0xffE3E5E5)),
    ),
    secondarySelectedColor: primaryColorLight.shade100,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    labelStyle: const TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.w600,
    ),
    secondaryLabelStyle: const TextStyle(
      color: Colors.black,
    ),
    brightness: Brightness.light,
  );
  static final dividerThemeLight = DividerThemeData(color: Colors.grey[300]);
  static final tabBarThemeLight = TabBarTheme(
    labelColor: primaryColorLight,
    unselectedLabelColor: Color(0xffABABAB),
  );
  static final floatingActionButtonThemeLight = FloatingActionButtonThemeData(
    foregroundColor: Colors.white,
    backgroundColor: primaryColorLight,
  );
  static final elevatedButtonThemeLight = ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.resolveWith(
        (states) => const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
      ),
      shape: MaterialStateProperty.resolveWith((states) =>
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
      foregroundColor: MaterialStateColor.resolveWith(
        (states) => Colors.white,
      ),
    ),
  );
  static final bottomNavigationBarThemeLight = BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: primaryColorLight,
    selectedLabelStyle: const TextStyle(fontSize: 12, height: 1.6),
    unselectedLabelStyle: const TextStyle(fontSize: 12),
    elevation: 35,
    landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
    unselectedItemColor: Colors.grey[500],
  );
  static const bottomSheetThemeLight = BottomSheetThemeData(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
    ),
  );
  static const appBarThemeLight = AppBarTheme(
    foregroundColor: Colors.black,
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 22,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      fontFamily: "Inter",
      brightness: Brightness.light,
      primarySwatch: primaryColorLight,
      iconTheme: const IconThemeData(size: 20),
      scaffoldBackgroundColor: const Color(0xffF8F8F8),
      appBarTheme: appBarThemeLight,
      outlinedButtonTheme: outlinedButtonThemeLight,
      chipTheme: chipThemeLight,
      dividerTheme: dividerThemeLight,
      tabBarTheme: tabBarThemeLight,
      inputDecorationTheme: inputDecorationThemeLight,
      primaryColor: primaryColorLight,
      floatingActionButtonTheme: floatingActionButtonThemeLight,
      elevatedButtonTheme: elevatedButtonThemeLight,
      bottomNavigationBarTheme: bottomNavigationBarThemeLight,
      bottomSheetTheme: bottomSheetThemeLight,
      textTheme: textThemeLight,
    );
  }

  /// Dark Theme
  ///
  static TextTheme textThemeDark = TextTheme(
    bodyText1: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      color: Colors.grey[400],
    ),
    bodyText2: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: Colors.grey[300],
    ),
    headline1: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline4: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Colors.grey[400],
    ),
  );

  static InputDecorationTheme inputDecorationThemeDark = InputDecorationTheme(
    // enabledBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.red),
    ),
    hintStyle: const TextStyle(color: Color(0xffA9A9A9)),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        width: 1,
        color: primaryColorDark,
      ),
    ),

    contentPadding: const EdgeInsets.fromLTRB(30, 20, 20, 20),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        width: 1,
        color: Colors.grey[800]!,
      ),
    ),
  );

  static final outlinedButtonThemeDark = OutlinedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.resolveWith(
        (states) => RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    ),
  );
  static final chipThemeDark = ChipThemeData(
    backgroundColor: Colors.grey[900]!,
    disabledColor: Colors.grey,
    selectedColor: primaryColorDark.shade200,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
      side: BorderSide(color: Colors.grey[800]!),
    ),
    secondarySelectedColor: primaryColorDark.shade200,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    labelStyle: const TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w600,
    ),
    secondaryLabelStyle: const TextStyle(
      color: Colors.white,
    ),
    brightness: Brightness.dark,
  );
  static final dividerThemeDark = DividerThemeData(color: Colors.grey[700]);
  static final tabBarThemeDark = TabBarTheme(
    labelColor: primaryColorLight,
    unselectedLabelColor: Color(0xffABABAB),
  );
  static final floatingActionButtonThemeDark = FloatingActionButtonThemeData(
    foregroundColor: Colors.white,
    backgroundColor: primaryColorDark,
  );
  static final elevatedButtonThemeDark = ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.resolveWith(
        (states) => const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
      ),
      shape: MaterialStateProperty.resolveWith((states) =>
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
      foregroundColor: MaterialStateColor.resolveWith(
        (states) => Colors.white,
      ),
    ),
  );
  static final bottomNavigationBarThemeDark = BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: primaryColorDark,
    backgroundColor: Colors.grey[900],
    selectedLabelStyle: const TextStyle(fontSize: 12, height: 1.6),
    unselectedLabelStyle: const TextStyle(fontSize: 12),
    elevation: 35,
    landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
    unselectedItemColor: Colors.grey[500],
  );
  static const bottomSheetThemeDark = BottomSheetThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
    ),
  );
  static final appBarThemeDark = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.grey[900],
    foregroundColor: Colors.white,
    titleTextStyle: const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w500,
    ),
  );

  static ThemeData dark() {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.selected,
        MaterialState.dragged,
      };
      if (states.any(interactiveStates.contains)) {
        return primaryColorDark;
      }
      return Colors.grey[800]!;
    }

    return ThemeData(
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary: primaryColorDark.shade200,
            brightness: Brightness.dark,
            primaryVariant: primaryColorDark,
            primary: primaryColorDark,
            onSecondary: primaryColorDark.shade100,
            surface: primaryColorDark,
            background: Colors.white,
            onBackground: Colors.white,
            secondaryVariant: Colors.white,
          ),
      fontFamily: "Inter",
      primarySwatch: primaryColorDark,
      primaryColorDark: primaryColorDark,
      iconTheme: const IconThemeData(size: 20),
      scaffoldBackgroundColor: const Color(0xff1a1a1a),
      appBarTheme: appBarThemeDark,
      // outlinedButtonTheme: outlinedButtonThemeDark,
      chipTheme: chipThemeDark,
      switchTheme: SwitchThemeData(
        overlayColor: MaterialStateProperty.resolveWith(
          (states) => primaryColorDark.shade200,
        ),
        thumbColor: MaterialStateProperty.resolveWith(
          (states) => getColor(states),
        ),
        trackColor: MaterialStateProperty.resolveWith(
          (states) => states.any((state) => state == MaterialState.selected)
              ? primaryColorDark.shade500
              : Colors.grey[500],
        ),
      ),
      dividerTheme: dividerThemeDark,
      tabBarTheme: tabBarThemeDark,
      inputDecorationTheme: inputDecorationThemeDark,
      primaryColor: primaryColorDark,
      floatingActionButtonTheme: floatingActionButtonThemeDark,
      elevatedButtonTheme: elevatedButtonThemeDark,
      bottomNavigationBarTheme: bottomNavigationBarThemeDark,
      bottomSheetTheme: bottomSheetThemeDark,
      textTheme: textThemeDark,
    );
  }
}
