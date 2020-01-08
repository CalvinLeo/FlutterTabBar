import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class AppIcons {
  AppIcons._();

  static const _kFontFamily = "Material Icons";
  
  static const Icon home = const Icon(
    Icons.home,
    color: Colors.green,
  );

  static const Icon find = const Icon(
    Icons.find_in_page,
    color: Colors.green,
  );

  static const Icon me = const Icon(
    Icons.person,
    color: Colors.green,
  );

  static const IconData home_data = const IconData(0xe88a, fontFamily: _kFontFamily);
  static const IconData discover_data = const IconData(0xe881, fontFamily: _kFontFamily);
  static const IconData person_data = const IconData(0xe7fd, fontFamily: _kFontFamily);
}