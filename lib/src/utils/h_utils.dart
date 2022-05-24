import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hudle_core/src/state/state_manager.dart';
import 'package:hudle_theme/hudle_theme.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

//T? provideViewModel<T extends BaseViewModel>(BuildContext context) => StateManager.of<T>(context)?.viewModel;

void showSnack(
    {String title = "Info",
      required String message,
      bool error = false,
      Duration animationDuration = const Duration(milliseconds: 240),
      Duration duration = const Duration(seconds: 5),
      bool legacyStyle = true}) {
  if (legacyStyle) {
    Get.snackbar(title, message,
        titleText: Container(),
        //To remove title
        borderRadius: 8,
        colorText: kColorWhite,
        animationDuration: animationDuration,
        duration: duration,
        margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: error ? kColorError : kColorBlack);
    return;
  }

  Get.snackbar(title, message,
      animationDuration: Duration(milliseconds: 300),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: error ? kColorError : null);
}

void handleLaunchToStore(String appPackageName) {
  debugPrint(
      "LAUNCH APP STORE OR PLAY STORE FOR THIS PACKAGE: " + appPackageName);

  if (GetPlatform.isAndroid) {
    openPlayStore(appPackageName);
  } else if (GetPlatform.isIOS) {
    openAppStore(appPackageName);
  }
}

void openPlayStore(String appPackageName) async {
  try {
    launch("market://details?id=" + appPackageName);
  } on PlatformException catch (e) {
    launch("https://play.google.com/store/apps/details?id=" + appPackageName);
  }
}

void openAppStore(String appPackageName) async {
  try {
    launch(
        "https://apps.apple.com/in/app/hudle-sports-venues-events/id1380053168?referrer=utm_source%3Dhudlehomepage%26utm_medium%3Dheader");
  } on PlatformException catch (e) {
    showSnack(message: 'App not found');
    //launch("https://play.google.com/store/apps/details?id=" + appPackageName);
  }
}
