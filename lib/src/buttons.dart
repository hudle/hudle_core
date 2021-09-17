import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hudle_theme/hudle_theme.dart';

import '../hudle_core.dart';

class PrimaryButton extends StatelessWidget {

  final String text;
  final Function onPressed;
  final double height;
  final double width;

  PrimaryButton({required this.text,required this.onPressed, this.height = 30, this.width = 88});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        shape: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(4)
        ),
        elevation: 0,
        height: height,
        minWidth: width,
        disabledColor: kColorGrey400,
        splashColor: kColorAccentDark,
        color: kColorAccent,
        child: Text("$text".toUpperCase(), style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            color: kColorWhite
        ),),
        onPressed: () {
          onPressed();
        });
  }
}


class AccentButton extends StatelessWidget {

  final String text;
  final Function onPressed;
  final double height;
  final double width;
  final EdgeInsets? padding;

  AccentButton({required this.text,required this.onPressed, this.height = 40, this.width = 88, this.padding});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: padding,
        shape: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(4)
        ),
        elevation: 0,
        height: height,
        minWidth: width,
        disabledColor: kColorGrey400,
        splashColor: kColorAccentDark,
        color: kColorAccent20,
        child: Text("$text".toUpperCase(), style: GoogleFonts.roboto(
            fontWeight: FontWeight.w500,
            color: kColorAccent
        ),),
        onPressed: () {
          onPressed();
        });
  }
}

class StrokeButton extends OutlinedButton {
  StrokeButton({required String text, required VoidCallback onPressed, double fontSize = 13, IconData? icon, bool isTrailingIcon = true}) : super(
      child: icon != null ? Row(
        children: [
          if (!isTrailingIcon) Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Icon(icon, color: kSecondaryText, size: fontSize* 1.5,),
          ),
          SecondaryText(text, fontSize: fontSize,),
          if (isTrailingIcon) Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Icon(icon, color: kSecondaryText, size: fontSize* 1.5,))
        ],
      ) : SecondaryText(text, fontSize: fontSize,),
      onPressed: onPressed
  );
}

class RetryImageButton extends StatelessWidget {

  final String text;
  final Function onPressed;
  final double height;
  final double width;

  RetryImageButton({required this.text,required this.onPressed, this.height = 25, this.width = 60});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        shape: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(4)
        ),
        elevation: 0,
        height: height,
        minWidth: width,
        disabledColor: kColorGrey400,
        splashColor: kColorPrimary,
        color: Colors.black54,
        child: Text("$text".toUpperCase(), style: GoogleFonts.roboto(
            fontWeight: FontWeight.w500,
            color: kColorWhite,
            fontSize: 12
        ),),
        onPressed: () {
          onPressed();
        });
  }
}

class SelectorButton extends StatelessWidget {
  final bool isSelected;
  final String text;
  final double? width;
  final VoidCallback? onTap;
  const SelectorButton(
      {Key? key, this.isSelected = false, this.width, required this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
          color: isSelected ? kColorAccent20 : kColorDisabled,
          borderRadius: BorderRadius.circular(4)),
      child: InkWell(
        onTap: onTap,
        child: Center(
            child: NormalText(text,
                color: isSelected ? kColorAccent : kPrimaryText,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal)),
      ),
    );
  }
}



