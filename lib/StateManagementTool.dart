import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ItemProvider with ChangeNotifier{
  List<Map<String, dynamic>> stateItems = [];

  List<Map<String, dynamic>> get items => stateItems;

  final String baseUrl = "https://jsonplaceholder.typicode.com/posts?_start=0&_limit=20";

  ItemProvider(){
    fetchItems();
  }

   Future<void> fetchItems() async {

    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      print("Fetch Success");
      stateItems = List<Map<String, dynamic>>.from(json.decode(response.body));
      notifyListeners();
    }
   }

  Future<void> addItem(String title, String body) async{
    final response = await http.post(
        Uri.parse("https://jsonplaceholder.typicode.com/post"),
        body: json.encode({
          "title": title,
          "body": body
        }),
        headers: {"Content-Type":"application/json"},
    );
    if(response.statusCode >= 200){
      print("Add Success");
      Map<String,dynamic> postMap = {
        "userId": 1,
        "id": items.length+1,
        "title": title,
        "body": body,
      };
      items.add(postMap);
      notifyListeners();
    }
  }
  Future<void> updateItem(int index,int id,String title, String body) async{

    final response = await http.put(
      Uri.parse("https://jsonplaceholder.typicode.com/post/$id"),
      body: json.encode({
            "title": title,
            "body": body,
          }),
      headers: {"Content-Type":"application/json"},
    );
    if(response.statusCode >= 200){
      print("id Number $id and index number $index Updated Successfully");
      var item = items[index];
      item["title"] = title;
      item["body"] = body;
      notifyListeners();
    }

  }

  Future<void> deleteItem(int id,int index) async{
    final response = await http.delete( Uri.parse("https://jsonplaceholder.typicode.com/post/$id"),);
    if(response.statusCode >= 200){
      print("id Number $id and index number $index Deleted Successfully");
      items.removeAt(index);
      notifyListeners();
    }

  }


}