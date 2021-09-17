import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap_widget/gap_widget.dart';
import 'package:hudle_theme/hudle_theme.dart';

import '../hudle_core.dart';

class BodyContainer extends Container {
  BodyContainer({Widget? child, double defaultPadding = 12, Color? color})
      : super(
            child: child,
            padding: EdgeInsets.all(defaultPadding),
            color: color);
}

class OutlineContainer extends Container {
  OutlineContainer(
      {Widget? child,
      double borderRadius = 8,
      double? width,
      double? height,
      Color? color,
      EdgeInsets? margin,
      EdgeInsets? padding,
      Color borderColor = kColorBackground})
      : super(
            child: child,
            padding: padding,
            margin: margin,
            height: height,
            width: width,
            decoration: BoxDecoration(
                color: color,
                border: Border.all(color: borderColor),
                borderRadius: BorderRadius.circular(borderRadius)));
}

class SectionCard extends StatelessWidget {
  final String header;
  final String? trailingText;
  final EdgeInsets? margin;
  final Widget child;

  const SectionCard(
      {Key? key,
        required this.child,
        required this.header,
        required this.trailingText,
        this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin ?? EdgeInsets.only(bottom: 8),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0), borderSide: BorderSide.none),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PrimaryTextMedium(
                  header,
                  fontSize: 18,
                ),
                Visibility(
                  visible: trailingText != null,
                  child: NormalText(
                    trailingText ?? "",
                    fontSize: 12,
                    color: kColorAccent,
                  ),
                )
              ],
            ),
            VerticalGap(),
            child
          ],
        ),
      ),
    );
  }
}




