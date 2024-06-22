
import 'package:flutter/material.dart';

class TColor {
  static Color get primaryColor1 => const Color(0xff92A3FD);
  static Color get primaryColor2 => const Color(0xff9DCEFF);
  static Color get primaryColor3 => Color.fromRGBO(222, 255, 204, 1);
  static Color get primaryColor4 => Color.fromRGBO(93, 252, 204, 1);
  static Color get primaryColor5 => Color.fromRGBO(40, 60, 134, 1);
  static Color get primaryColor6 => Color.fromRGBO(16, 110, 17, 1)
;

  static Color get secondaryColor1 => const Color(0xffC58BF2);
  static Color get secondaryColor2 => const Color(0xffEEA4CE);


  static List<Color> get primaryG => [ primaryColor2, primaryColor1 ];
  static List<Color> get secondaryG => [secondaryColor2, secondaryColor1];
  static List<Color> get primaryGr => [ primaryColor3, primaryColor4 ];
  static List<Color> get primaryb => [ primaryColor5, primaryColor6 ]; 
    static List<Color> get primaryGrey => [ Colors.grey.shade100, Colors.grey.shade300 ];


  static Color get black => const Color(0xff1D1617);
  static Color get gray => const Color(0xff786F72);
  static Color get white => Colors.white;
  static Color get lightGray => const Color(0xffF7F8F8);



}