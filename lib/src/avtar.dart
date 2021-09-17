import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hudle_theme/hudle_theme.dart';

class HudleAvatar extends StatelessWidget {

  final bool enableShadow;
  final double radius;
  final int borderSize;
  final String? url;


  HudleAvatar({this.enableShadow = false, this.radius = 36, this.borderSize = 2, this.url});

  @override
  Widget build(BuildContext context) {

    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(blurRadius: 2, color: kColorLight, spreadRadius: 2)],
        ),
        child: CircleAvatar(
          backgroundColor: kColorWhite,
          radius: radius + borderSize,
          child: CircleAvatar(
              radius: radius,
              backgroundImage: CachedNetworkImageProvider(url ?? ""),
              backgroundColor: Color(0xff556080),
              child: url == null ? Icon(
                Icons.person,
                size: 55,
              ) : Container()
          ),
        ));
  }
}
