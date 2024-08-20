import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/constants.dart';
import '../models/article.dart';

class NewsWebService {
  static var client = http.Client();

  static Future<List<Article>?> fetchNews() async {
    var response = await client.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=${Constants.country}&apiKey=${Constants.apiKey}&${Constants.page}=1&pageSize=100'));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return (jsonData['articles'] as List)
          .map((e) => Article.fromJson(e))
          .toList();
    } else {
      return null;
    }
  }
}
