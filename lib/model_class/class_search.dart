import 'package:flutter/material.dart';
import 'package:magnifico/screens/event_details_page.dart';
import 'package:magnifico/services/api_services.dart';

import 'class_content.dart';

class Search extends SearchDelegate {
  late final List<Datum> Sdata;
  Search(List<Datum> data) {
    this.Sdata = data;
  }
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query == null) {
                Navigator.pop(context);
              } else {
                query = '';
              }
            },
            icon: Icon(Icons.close))
      ];
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back));
  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = Sdata.where((datum) {
      return datum.title!.contains(query) || datum.description!.contains(query);
    }).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        final suggestion = suggestionList[index];
        return ListTile(
          title: Text(suggestion!.title!),
          subtitle: Text(suggestion!.description!),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const EventDetailsPage()));
          },
        );
      },
    );
  }
}
