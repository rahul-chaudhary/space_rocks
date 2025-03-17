import 'package:flutter/foundation.dart';
import 'app_strings.dart';

void dbPrint(Object? object, {bool isPointyLineVisible = true}) {

  if (kDebugMode) {
    if(isPointyLineVisible) {
      print(AppStrings.pointyLine + object.toString());
    } else {
      print(object);
    }
  }
}
