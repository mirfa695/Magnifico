import 'package:flutter/material.dart';
import 'package:magnifico/custom_widgets/custom_container.dart';
import 'package:magnifico/model_class/class_content.dart';
import 'package:magnifico/utilities/const_colors.dart';
import 'package:readmore/readmore.dart';

class EventDetailsPage extends StatelessWidget {
  final Datum? datum;
  const EventDetailsPage({this.datum, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: <Color>[Colors.black, Colors.white])),
          ),
          title: const Text(
            'Event Details',
            style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, size: 22),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                  width: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(.2)),
                    child: const Icon(Icons.bookmark),
                  )),
            )
          ],
        ),
        body: ListView(children: [
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(datum!.bannerimage!), fit: BoxFit.fill)),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            datum!.title!,
            style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                fontSize: 34,
                color: ConstColors.constBlackColor),
          ),
          CustomContainer(
            image: NetworkImage(datum!.organisericon!),
            name: 'organization',
            color: Colors.white,
          ),
          CustomContainer(
            image: const AssetImage('assets/images/img_1.png'),
            name: datum!.datetime!,
            subtext: datum?.datetime!,
          ),
          CustomContainer(
              image: const AssetImage('assets/images/img.png'),
              name: datum!.venuename!,
              subtext: "${datum?.venuecity}, ${datum?.venuecountry}"),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About Event',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      color: ConstColors.constBlackColor,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                ReadMoreText(
                  datum!.description!,
                  textAlign: TextAlign.justify,
                  trimLines: 5,
                  colorClickableText: ConstColors.constBlueColor,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Read more',
                  trimExpandedText: 'Show less',
                  moreStyle:  TextStyle(fontSize: 14,color: ConstColors.constBlueColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ConstColors.constBlueColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'BOOK NOW',
                            style: TextStyle(fontSize: 16),
                          ),
                          RawMaterialButton(
                            onPressed: () {},
                            elevation: 2.0,
                            fillColor: Colors.indigo,
                            padding: const EdgeInsets.all(10.0),
                            shape: const CircleBorder(),
                            child: const Icon(
                              Icons.arrow_forward,
                              size: 20.0,
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          )
        ]));
  }
}
