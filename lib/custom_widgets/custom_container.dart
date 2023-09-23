import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utilities/const_colors.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer(
      {this.image, required this.name, this.subtext, this.color, Key? key})
      : super(key: key);
  Color? color;
  String name;
  String? subtext;
  ImageProvider<Object>? image;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 8),
          child: Container(
            height: 54,
            width: 51.68,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: image ??
                      const NetworkImage(
                          'https://tacm.com/wp-content/uploads/2018/01/no-image-available.jpeg'),
                  scale: 1.8,
                  fit: BoxFit.scaleDown,
                ),
                color: color ?? ConstColors.constBlueColor.withOpacity(.2),
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              child: Text(
                name,
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.fade,
                    fontSize: 15,
                    color: ConstColors.constBlack1Color),
              ),
            ),
            Text(
              subtext ?? 'No text',
              style: TextStyle(
                  color: ConstColors.constGrey2Color,
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ],
    );
  }
}
