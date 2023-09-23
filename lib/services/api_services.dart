import 'dart:convert';

import '../model_class/class_content.dart';
import 'package:http/http.dart' as http;

class APIServices {
  Future<List<Datum>> getApi() async {
    try {
      final response = await http.get(Uri.parse(
          'https://sde-007.api.assignment.theinternetfolks.works/v1/event'));
      var jsonData = json.decode(response.body);
      List<Datum> content = jsonData["content"]["data"].map<Datum>((e) {
        return Datum.fromJson(e);
      }).toList();
      return content;
    } catch (e) {
      rethrow;
    }
  }

  List<Datum> search(List<Datum> data, String searchQuery) {
    return data.where((datum) {
      return datum.title!.contains(searchQuery) ||
          datum.description!.contains(searchQuery);
    }).toList();
  }
}
