import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_mp_app/utils/colors.dart';

class RegionCard extends StatelessWidget {
  final String subtitle;
  final bool isFilled;

  const RegionCard({Key key, this.subtitle, this.isFilled}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textColor = isFilled ? Colors.white : Colors.black;
    final subColor = isFilled ? Vx.green200 : Vx.gray700;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [subtitle.text.bold.color(textColor).xl2.make()],
        ),
      ],
    )
        .box
        .linearGradient(
            isFilled ? [blueish, lightBlueish] : [whitecolor, whitecolor])
        .color(isFilled ? blueish : Colors.white)
        .padding(EdgeInsets.symmetric(horizontal: 16, vertical: 32))
        .rounded
        .shadowLg
        .border(color: blueish, width: isFilled ? 0 : 0.3)
        .make();
  }
}
