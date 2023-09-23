import 'package:flutter/material.dart';
import 'package:magnifico/utilities/const_colors.dart';

class CustomCard extends StatelessWidget {
  CustomCard(
      {this.image,
      this.date,
      this.title,
      this.place,
      this.city,
      this.country,
      Key? key})
      : super(key: key);
  String? image;
  String? date;
  String? title;
  String? place;
  String? city;
  String? country;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 92,
              width: 79,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(image ??
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png'),
                      fit: BoxFit.fill)),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date ?? 'No Date & Time',
                  style: TextStyle(
                      color: ConstColors.constBlueColor, fontSize: 13),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  title ?? 'No Title',
                  style: TextStyle(
                      color: ConstColors.constBlackColor,
                      fontFamily: 'Inter',
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 20,
                  width: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Icon(
                        Icons.location_pin,
                        size: 14,
                        color: ConstColors.constGreyColor,
                      ),
                      Text(
                        place ?? ' No place  ',
                        style: TextStyle(
                            color: ConstColors.constGreyColor,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 13),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  ' • $city, $country',
                  style: TextStyle(
                      color: ConstColors.constGreyColor,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 13),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
