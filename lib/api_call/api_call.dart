import 'dart:convert';

import 'package:http/http.dart' as http;

class APICalls {
  Future getObjects() async {
    final response =
        await http.get(Uri.parse("https://api.restful-api.dev/objects"));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data;
      // print(response.body);
    } else {
      return [];
    }
  }
}
