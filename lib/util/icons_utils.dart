import 'package:flutter/material.dart';

Map _icons = <String, IconData>{
  "bookmark_border": Icons.bookmark_border,
  "alarm": Icons.alarm,
  "library_add_check": Icons.library_add_check,
};

Icon getIcon(String nombreIcon, Color colors) {
  return Icon(_icons[nombreIcon], color: colors ,size: 20,);
}
