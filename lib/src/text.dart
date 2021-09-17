import 'package:flutter/material.dart';
import 'package:hudle_theme/hudle_theme.dart';
import 'package:gap_widget/gap_widget.dart';


class PrimaryText extends Text {
  final FontWeight? fontWeight;
  final double fontSize;

  PrimaryText(String data, {this.fontWeight, this.fontSize = 16, int? maxLines, TextOverflow? overflow,})
      : super(data, maxLines: maxLines, overflow: overflow,
      style: primaryStyle(fontWeight: fontWeight, fontSize: fontSize));
}


class PrimaryTextMedium extends Text {
  final double fontSize;

  PrimaryTextMedium(String data, {this.fontSize = 16, int? maxLines, TextOverflow? overflow,})
      : super(data, maxLines: maxLines, overflow: overflow,
      style:
      primaryStyle(fontWeight: FontWeight.w500, fontSize: fontSize));
}


class SecondaryText extends Text {
  final FontWeight? fontWeight;
  final double fontSize;

  SecondaryText(String data, {this.fontWeight, this.fontSize = 14, TextOverflow? overflow, int? maxLines})
      : super(data, overflow: overflow, maxLines: maxLines,
      style: secondaryStyle(fontWeight: fontWeight, fontSize: fontSize));
}


class NormalText extends Text {
  final Color color;
  final FontWeight? fontWeight;
  final double fontSize;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;

  NormalText(String data,
      {this.fontWeight,
        this.fontSize = 14,
        this.color = kPrimaryText,
        this.textAlign, this.textDecoration, TextOverflow? overflow, int? maxLines})
      : super(data,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: normalStyle(
          fontWeight: fontWeight, fontSize: fontSize, color: color, decoration: textDecoration));
}


class ErrorText extends StatelessWidget {

  final String? errorText;
  final double fontSize;
  final Color errorColor;
  final EdgeInsets? padding;

  ErrorText(this.errorText,{this.fontSize = 12.0, this.errorColor = kColorError, this.padding});

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: errorText != null ,
        child: Padding(
          padding: padding ?? const EdgeInsets.symmetric(vertical: 12),
          child: NormalText(errorText ?? "", color: errorColor, fontSize: fontSize,),
        ));
  }
}


class HeaderText extends StatelessWidget {

  final String pathIcon;
  final String title;
  final String? subtitle;
  final IconData? iconData;


  HeaderText(this.pathIcon, this.title, {this.iconData, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          )
      ),
      elevation: 0.5,
      margin: const EdgeInsets.only(bottom: 1),
      child: Container(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                iconData != null
                    ? Icon(iconData, color: kSecondaryText, size: 18,)
                    : Container(),
                HorizontalGap(),
                Text(title.toUpperCase(), style: normalStyle(fontSize: 16, color: kSecondaryText, fontWeight: FontWeight.w500),)
              ],
            ),
            if (subtitle != null) Padding(
              padding: const EdgeInsets.only(left: 26),
              child: Text(subtitle ?? "", style: normalStyle(fontSize: 14, color: kTertiaryText),),
            )
          ],
        ),
      ),
    );
  }
}


class BigHeadingText extends HeadingText {
  BigHeadingText(String title, {double textSize = 14}) : super(title, color: kColorPrimary, textSize: textSize,);
}


class HeadingText extends StatelessWidget {

  final String? title;
  final Color? color;
  final double? textSize;

  HeadingText(this.title, {this.color, this.textSize});

  @override
  Widget build(BuildContext context) {
    return Text(title!.toUpperCase(), style: normalStyle(fontSize: textSize ?? 11 , color: color ?? kSecondaryText, fontWeight: FontWeight.w500),);
  }
}

class DataText extends StatelessWidget {

  final String data;

  DataText(this.data);

  @override
  Widget build(BuildContext context) {
    return Text(data, style: primaryStyle(fontSize: 15),);
  }
}

class VerticalHeadDataText extends StatelessWidget {

  final String? header;
  final String? data;

  VerticalHeadDataText({required this.header, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingText(header),
          VerticalGap(gap: 2,),
          DataText(data!)
        ],
      ),
    );
  }
}


class LabelText extends StatelessWidget {
  final String text;
  final IconData icon;
  final double fontSize;
  final double iconPadding;
  final Color iconColor;
  final Color textColor;
  final Color? backgroundColor;
  final double cornerRadius;
  final IconArrangement arrangement;

  const LabelText(
      {Key? key,
        required this.text,
        required this.icon,
        this.arrangement = IconArrangement.right,
        this.fontSize = 12,
        this.iconPadding = 4,
        this.cornerRadius = 0.0,
        this.backgroundColor,
        this.textColor = kPrimaryText,
        this.iconColor = kColorAccent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(cornerRadius)
        ),
        padding: backgroundColor != null ? EdgeInsets.symmetric(horizontal: 8, vertical: 4) : null,
        child: arrangement == IconArrangement.right ||
            arrangement == IconArrangement.left
            ? horizontalArrangement()
            : verticalArrangement());
  }

  Widget horizontalArrangement() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (arrangement == IconArrangement.left)
          Padding(
            padding: EdgeInsets.only(right: iconPadding),
            child: iconWidget,
          ),
        textWidget,
        if (arrangement == IconArrangement.right)
          Padding(
            padding: EdgeInsets.only(left: iconPadding),
            child: iconWidget,
          ),
      ],
    );
  }

  Widget verticalArrangement() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (arrangement == IconArrangement.top)
          Padding(
            padding: EdgeInsets.only(bottom: iconPadding),
            child: iconWidget,
          ),
        textWidget,
        if (arrangement == IconArrangement.bottom)
          Padding(
              padding: EdgeInsets.only(top: iconPadding),
              child: iconWidget
          ),
      ],
    );
  }

  Widget get iconWidget => Icon(icon, size: fontSize * 1.5, color: iconColor,);

  Widget get textWidget => NormalText(text, color: textColor,);
}

enum IconArrangement { left, right, top, bottom }
