import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:users_api/constants/constants.dart';

class ApiService {
  Future getUser() async {
    var client = http.Client();
    var url = Uri.parse(Constants.baseUrl + Constants.usersEndPoint);

    var response = await client.get(url);

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(decodedData);
    }
  }
}
