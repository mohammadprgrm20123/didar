import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class Utils {
  static const double tinySpace = 4;
  static const double smallSpace = 8;
  static const double mediumSpace = 16;
  static const double largeSpace = 24;
  static const double giantSpace = 32;

  static Gap tinyGap = const Gap(tinySpace);
  static Gap smallGap = const Gap(smallSpace);
  static Gap mediumGap = const Gap(mediumSpace);
  static Gap largeGap = const Gap(largeSpace);
  static Gap giantGap = const Gap(giantSpace);

  static void showSuccess(){

    Get.snackbar('Operation Success','',backgroundColor: Colors.green.shade200);


  }

  static void showError({String? title}){
    Get.snackbar(title??'Error','',backgroundColor: Colors.red.shade200);


  }


  static TextStyle buildTextStyle() => const TextStyle(
      color: Colors.black54, fontWeight: FontWeight.normal, fontSize: 14);
}
