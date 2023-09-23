class Content {
  List<Datum?>? data;
  Meta? meta;

  Content({this.data, this.meta});

  Content.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Datum>[];
      json['data'].forEach((v) {
        data!.add(Datum.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta?.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (data != null) {
      data['data'] = data.values.map((v) => v.toJson()).toList();
    } else {
      data['data'] = null;
    }
    data['meta'] = meta!.toJson();
    return data;
  }
}

class Datum {
  int? id;
  String? title;
  String? description;
  String? bannerimage;
  String? datetime;
  String? organisername;
  String? organisericon;
  String? venuename;
  String? venuecity;
  String? venuecountry;

  Datum(
      {this.id,
      this.title,
      this.description,
      this.bannerimage,
      this.datetime,
      this.organisername,
      this.organisericon,
      this.venuename,
      this.venuecity,
      this.venuecountry});

  Datum.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    bannerimage = json['banner_image'];
    datetime = json['date_time'];
    organisername = json['organiser_name'];
    organisericon = json['organiser_icon'];
    venuename = json['venue_name'];
    venuecity = json['venue_city'];
    venuecountry = json['venue_country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['banner_image'] = bannerimage;
    data['date_time'] = datetime;
    data['organiser_name'] = organisername;
    data['organiser_icon'] = organisericon;
    data['venue_name'] = venuename;
    data['venue_city'] = venuecity;
    data['venue_country'] = venuecountry;
    return data;
  }
}

class Meta {
  int? total;

  Meta({this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['total'] = total;
    return data;
  }
}

class Root {
  Content? content;
  bool? status;

  Root({this.content, this.status});

  Root.fromJson(Map<String, dynamic> json) {
    content =
        json['content'] != null ? Content?.fromJson(json['content']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['content'] = content!.toJson();
    data['status'] = status;
    return data;
  }
}
