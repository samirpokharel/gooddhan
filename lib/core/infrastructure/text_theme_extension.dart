import 'package:flutter/material.dart';

extension TextThemeX on BuildContext {
  TextStyle? get bodyText1 => Theme.of(this).textTheme.bodyText1;
  TextStyle? get bodyText2 => Theme.of(this).textTheme.bodyText2;
  TextStyle? get headline1 => Theme.of(this).textTheme.headline1;
  TextStyle? get headline2 => Theme.of(this).textTheme.headline2;
}
