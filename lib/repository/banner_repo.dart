import 'dart:convert';
import 'package:http/http.dart';


import 'dart:io';

import 'package:new_cola/model/banner.dart';

class BannerRepo {
  String URL = Platform.isAndroid ? 'http://10.0.2.2:3000' : 'http://localhost:3000';

  Future<List<Banner>> loadData() async {
    Client client = Client();
    Uri url = Uri.parse('$URL/bannerlist');

    var response = await client.get(url);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
      List<Banner> list = body.map((e) => Banner.fromJson(e)).toList();
      return list;
    }else{
      return [];
    }
  }
}