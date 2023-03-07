import 'dart:convert';

import 'package:http/http.dart';
import 'dart:io';

import 'package:new_cola/model/event.dart';

class EventRepo {
  String URL =
      Platform.isAndroid ? 'http://10.0.2.2:3000' : 'http://localhost:3000';

  Future<Event> loadData(idx) async {
    Client client = Client();
    Uri url = Uri.parse('$URL/bannerlist/$idx');

    var response = await client.get(url);

    if (response.statusCode == 200) {
      dynamic body = jsonDecode(utf8.decode(response.bodyBytes));
      Event item = Event.fromJson(body);

      return item;
    } else {
      throw HttpException('Failed to load event: ${response.statusCode}');
    }
  }
}
