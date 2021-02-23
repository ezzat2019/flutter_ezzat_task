import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


class LoadingHelper {
  static void showToast(String msg) {
    EasyLoading.instance
      ..backgroundColor = Colors.amber.shade900

      ..loadingStyle = EasyLoadingStyle.custom
      ..textColor = Colors.white
      ..indicatorColor = Colors.amber;


    EasyLoading.showToast(msg
      , toastPosition: EasyLoadingToastPosition.bottom,

    );
  }
  static void showLoading() {
    EasyLoading.instance
      ..backgroundColor = Colors.amber.shade900

      ..loadingStyle = EasyLoadingStyle.custom
      ..textColor = Colors.white
      ..indicatorColor = Colors.amber;


    EasyLoading.show(status:"Loading!",
    maskType: EasyLoadingMaskType.black);
  }
  static void closeLoading() {
    EasyLoading.dismiss();
  }
}