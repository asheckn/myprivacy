import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../constants/urls.dart';
import '../models/user.dart';

class ApiService{

  Future<dynamic> getUsers() async {
    String url = "$baseUrl/getAllUsers";
    print("getting users");
    final response = await http.get(Uri.parse(url));
    print(response.body);

    if (response.statusCode == 200 || response.statusCode == 400) {
      print(json.decode(response.body));
      return json.decode(response.body);
    } else {
      debugPrint(response.body.toString());
      debugPrint("Failed with code: ${response.statusCode}");
      return [];
    }
  }

  Future<dynamic> updateUser(User user) async {

    var endpointUrl = "$baseUrl/updateUser";


    var requestUrl = endpointUrl;
    final response = await http.put(Uri.parse(requestUrl),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Access-Control-Allow-Headers": "*",
        },
        body: user.toRawJson(),
        );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("updating user");
      return true;
    } else {
      debugPrint(response.body.toString());
      return false;
    }
  }

}