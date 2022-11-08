import 'package:wikipedia/src/utils/parse_html.dart';

class WikipediaSummaryData {
  int? pageid;
  int? ns;
  String? title;
  String? extract;
  String? description;
  String? descriptionsource;

  WikipediaSummaryData(
      {this.pageid,
        this.ns,
        this.title,
        this.extract,
        this.description,
        this.descriptionsource});

  WikipediaSummaryData.fromJson(Map<String, dynamic> json) {
    pageid = json['pageid'];
    ns = json['ns'];
    title = json['title'];
    extract = ParserHtml().parserHtml(json['extract']);
    description = ParserHtml().parserHtml(json['description']);
    descriptionsource = json['descriptionsource'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pageid'] = pageid;
    data['ns'] = ns;
    data['title'] = title;
    data['extract'] = extract;
    data['description'] = description;
    data['descriptionsource'] = descriptionsource;
    return data;
  }
}
