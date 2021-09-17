import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hudle_theme/hudle_theme.dart';
import 'package:gap_widget/gap_widget.dart';

import '../buttons.dart';

const STR_ERROR_UNEXPECTED = "Unexpected error";

class ErrorPage extends StatelessWidget {
  final String textError;
  final String textMessage;
  final Widget? image;
  final bool? showRetryButton;
  final Function? onRetryTap;
  final String retryText;

  ErrorPage(
      {this.textError = "Opps",
      this.textMessage = "The server took too long to respond.",
      this.image,
      this.onRetryTap,
      this.showRetryButton,
      this.retryText = "Retry"});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        color: kColorBackground,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                      height: 150,
                      width: 150,
                      child: image ??
                          Container() //IC_ERROR_XML.avdCustomSize(height: 150, width: 150),
                      ),
                ),
                VerticalGap.v20,
                Text(
                  "$textError",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      textStyle: Theme.of(context).textTheme.subtitle1),
                ),
                VerticalGap(
                  gap: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Text(
                    "$textMessage",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        fontSize: 14,
                        textStyle: Theme.of(context).textTheme.caption),
                  ),
                ),
                VerticalGap.v20,
                Visibility(
                  visible: showRetryButton != null
                      ? showRetryButton == true
                      : onRetryTap != null,
                  child: PrimaryButton(
                      text: retryText,
                      onPressed: () {
                        onRetryTap?.call();
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
