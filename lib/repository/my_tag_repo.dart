import 'dart:convert';

import 'package:http/http.dart';
import 'dart:io';

import 'package:new_cola/model/tags.dart';

class MyTagsRepo {
  String URL = Platform.isAndroid ? 'http://10.0.2.2:3000' : 'http://localhost:3000';

  Future<List<Tags>> loadData() async{
    Client client = Client();
    Uri url = Uri.parse('$URL/mytaglist');

    var response = await client.get(url);

    if(response.statusCode == 200){
      List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
      List<Tags> list = body.map((e) => Tags.fromJson(e)).toList();
      return list;
    } else {
      return [];
    }
  }
}