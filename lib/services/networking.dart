// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  final String apiUrl;
  NetworkHelper({
    required this.apiUrl,
  });

  Future getData() async {
    Uri url = Uri.parse(apiUrl);
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
