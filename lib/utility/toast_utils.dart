import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:universal_html/js.dart' as js;

import '../style/colors.dart';

class ToastUtility {
  static void showError(List<String> errors) {
    // if (kIsWeb) {
    //   js.context.callMethod('cleanAllToast');
    // }
    if (errors.isEmpty) return;
    Fluttertoast.showToast(
        msg: errors.join('\n'),
        toastLength: Toast.LENGTH_LONG,
        webPosition: 'center',
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 3,
        backgroundColor: MyColors.errorColor,
        textColor: Colors.white,
        webBgColor: '#D02149',
        webShowClose: true,
        fontSize: 16.0);
  }

  static void showSuccess({String? message}) {
    // if (kIsWeb) {
    //   js.context.callMethod('cleanAllToast');
    // }
    message ??= tr('common_update_data_success');
   final a =  Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        webPosition: 'center',
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 3,
        backgroundColor: MyColors.primaryColor,
        textColor: Colors.white,
        webBgColor: '#27AE60',
        webShowClose: true,
        fontSize: 16.0);
  }
}
