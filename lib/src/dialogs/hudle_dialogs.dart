import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap_widget/gap_widget.dart';
import 'package:get/get.dart';
import 'package:hudle_core/hudle_core.dart';
import 'package:hudle_theme/hudle_theme.dart';


Widget alertDialog(
    {required String title,
    required String content,
    String? positiveButton,
    Function? onPositiveTap,
    String negativeButton = "Cancel"}) {
  return AlertDialog(
    title: PrimaryTextMedium(
      title,
      fontSize: 18,
    ),
    content: SecondaryText(
      content,
      fontSize: 16,
    ),
    actions: [
      TextButton(
          child: NormalText(
            negativeButton.toUpperCase(),
            color: kColorAccent,
            fontWeight: FontWeight.w500,
          ),
          onPressed: () {
            Get.back();
          }),
      if (positiveButton != null)
        TextButton(
            child: NormalText(
              positiveButton.toUpperCase(),
              color: kColorAccent,
              fontWeight: FontWeight.w500,
            ),
            onPressed: () {
               onPositiveTap?.call();
            }),
    ],
  );
}

Widget updateDialog(String packageName) => alertDialog(
    title: "Upgrade Available!",
    content:
        "There\'s a new version of App available! Please update your app to use it further.",
    positiveButton: "Upgrade Now",
    onPositiveTap: () {
      handleLaunchToStore(packageName);
    });



Widget progressDialog({String message = "Please wait"}) => Dialog(
  child: Container(
    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
    child: Row(
      children: [
        CircularProgressIndicator(),
        HorizontalGap.h18,
        SecondaryText(message)
      ],
    ),
  ),
);

void showLogoutDialog() {
  Get.dialog(
      progressDialog(message: "Logging out..")
  );
}