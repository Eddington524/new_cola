import 'dart:convert';
import 'package:http/http.dart';

import 'dart:io';

import 'package:new_cola/model/news.dart';
String URL = Platform.isAndroid ? 'http://10.0.2.2:3000' : 'http://localhost:3000';

class NewsRepo {
  String URL = Platform.isAndroid ? 'http://10.0.2.2:3000' : 'http://localhost:3000';

  Future<List<News>> loadDate() async {
    Client client = Client();
    Uri url = Uri.parse('$URL/newslist');

    var response = await client.get(url);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
      List<News> list = body.map((e) => News.fromJson(e)).toList();
      return list;
    }else{
      return [];
    }
  }
}