import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class SPsetting {
  final String fontSizeKey = 'font_size';
  final String colorKey = 'color';
  static SharedPreferences _sp;
  static SPsetting _instances;
  SPsetting._internal();
//creating unnamed instructor
  factory SPsetting() {
    if (_instances == null) {
      _instances = SPsetting._internal();
    }
    return _instances;
  }
  Future init() async {
    _sp = await SharedPreferences.getInstance();
  }

  Future setColor(int color) {
    return _sp.setInt(colorKey, color);
  }

  int getColor() {
    int color = _sp.getInt(colorKey);
    if (color == null) {
      color = 0xff1976d2;
    }
    return color;
  }
}
