import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_api_try/model/my_model.dart';
import 'package:http/http.dart' as http;

class MyController with ChangeNotifier {
  Map<String, dynamic> decodedData = {};
  SampleApi sampleApiobj = SampleApi();
  Future fetchData() async {
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=apple&from=2024-03-06&to=2024-03-06&sortBy=popularity&apiKey=e8c8ab89a94343fdb306149805f02275");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
      sampleApiobj = SampleApi.fromJson(decodedData);
    } else {
      print("Api Failed");
    }
    notifyListeners();
  }

  //post

  Future postData({required String name, required String des}) async {
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=apple&from=2024-03-06&to=2024-03-06&sortBy=popularity&apiKey=e8c8ab89a94343fdb306149805f02275");
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
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=apple&from=2024-03-06&to=2024-03-06&sortBy=popularity&apiKey=e8c8ab89a94343fdb306149805f02275");
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
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=apple&from=2024-03-06&to=2024-03-06&sortBy=popularity&apiKey=e8c8ab89a94343fdb306149805f02275");
    final response = await http.delete(url);
    if (response.statusCode == 200) {
      await fetchData();
    } else {
      print("Api Failed");
    }
  }
}
