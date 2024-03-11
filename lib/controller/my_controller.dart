import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_api_try/model/my_model.dart';
import 'package:http/http.dart' as http;
import 'package:new_api_try/model/response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyController with ChangeNotifier {
  Map<String, dynamic> decodedData = {};
  Map<String, dynamic> decodedData2 = {};
  SampleApi sampleApiobj = SampleApi();
  ResponseModel responsemodelobj = ResponseModel();
  Future fetchData() async {
    notifyListeners();
    final url = Uri.parse("https://dummyjson.com/products");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
      sampleApiobj = SampleApi.fromJson(decodedData);
    } else {
      print("Api Failed");
    }
    notifyListeners();
  }

  Future loginApi({required String username, required String password}) async {
    final url = Uri.parse("https://dummyjson.com/auth/login");
    var response = await http.post(
      url,
      body: jsonEncode(
        {
          "username": username,
          "password": password,
        },
      ),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final decodedData2 = jsonDecode(response.body);
      responsemodelobj = ResponseModel.fromJson(decodedData2);

      // Obtain shared preferences.
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", responsemodelobj.token!);
      //print(response.body);
      print("Your token is: $decodedData2");
    } else {
      print("Api Failed");
    }
  }

  //post

  Future postData({required String name, required String des}) async {
    final url = Uri.parse("https://dummyjson.com/products");
    final response = await http.post(url);
    if (response.statusCode == 200) {
      await fetchData();
    } else {
      print("Api Failed");
    }
  }

  //update

  Future updateData(
      {required String id, required String name, required String des}) async {
    final url = Uri.parse("https://dummyjson.com/products");
    final response =
        await http.put(url, body: {"Name": name, "description": des});
    if (response.statusCode == 200) {
      await fetchData();
    } else {
      print("Api Failed");
    }
  }

  //delete

  Future deleteData({required String id}) async {
    final url = Uri.parse("https://dummyjson.com/products");
    final response = await http.delete(url);
    if (response.statusCode == 200) {
      await fetchData();
    } else {
      print("Api Failed");
    }
  }
}
