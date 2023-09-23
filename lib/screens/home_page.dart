import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magnifico/custom_widgets/custom_card.dart';
import 'package:magnifico/model_class/class_content.dart';
import 'package:magnifico/model_class/class_search.dart';
import 'package:magnifico/screens/event_details_page.dart';
import 'package:magnifico/services/api_services.dart';
import 'package:magnifico/utilities/const_textstyle.dart';

class HomePage extends StatelessWidget {
  late final List<Datum> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Events',
          style: ConstTStyle.textStyle,
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: Search(data));
            },
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          const Icon(
            Icons.more_vert,
            color: Colors.black,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FutureBuilder(
          future: APIServices().getApi(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EventDetailsPage(
                                    datum: snapshot.data![index])));
                      },
                      child: CustomCard(
                        image: snapshot.data![index].bannerimage,
                        title: snapshot.data![index].title,
                        city: snapshot.data![index].venuecity,
                        country: snapshot.data![index].venuecountry,
                        place: snapshot.data![index].venuename,
                        date: snapshot.data![index].datetime,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 5,
                      ),
                  itemCount: snapshot.data!.length);
            }
            return const Text('Error');
          },
        ),
      ),
    );
  }
}
