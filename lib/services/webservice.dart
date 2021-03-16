import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_list/models/dog.dart';
import 'package:flutter_app_list/models/cards.dart';
import 'package:http/http.dart' as http;

class Webservice {
  Future<List<Cards>> fetchCards(String keyword)async{
    var url =
    Uri.https("learnig1.firebaseio.com", '/as/Asd.json');
    final response = await http.get(url);
    if(response.statusCode == 200){
      debugPrint('dbsucces'+response.body);
      final body = jsonDecode(response.body);

      final Iterable json = body["body"];

      return json.map((movie) => Cards.fromJson(movie)).toList();

    }else{
      throw Exception("Unable to perform request!");
    }
  }
}