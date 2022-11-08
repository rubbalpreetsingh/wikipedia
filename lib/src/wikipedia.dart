import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wikipedia/src/models/search_query_model.dart';
import 'package:wikipedia/src/models/summary_data_model.dart';


String _baseUrl = "https://en.wikipedia.org/w/api.php";

class Wikipedia{
  Future<WikipediaResponse?> searchQuery({required String searchQuery, int limit=1})async{
    try{
      final _responseData = await http.get(Uri.parse("$_baseUrl?action=query&format=json&list=search&srlimit=$limit&srsearch=$searchQuery"));
      return WikipediaResponse.fromJson(json.decode(_responseData.body));
    }catch(e){
      return null;
    }
  }

  Future<WikipediaSummaryData?> searchSummaryWithPageId({required int pageId})async{
    try{
      final _responseData = await http.get(Uri.parse("$_baseUrl?action=query&format=json&pageids=$pageId&prop=extracts|description"));
      return WikipediaSummaryData.fromJson(json.decode(_responseData.body)["query"]["pages"]["$pageId"]);
    }catch(e){
      return null;
    }
  }
}