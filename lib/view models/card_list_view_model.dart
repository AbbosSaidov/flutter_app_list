import 'package:flutter/material.dart';
import 'package:flutter_app_list/services/webservice.dart';
import 'package:flutter_app_list/view models/card_view_model.dart';
class CardlistViewModel extends ChangeNotifier {

  List<CardViewModel> movies = List<CardViewModel>();

  Future<void> fetchCards(String keyword) async {
    final results =  await Webservice().fetchCards(keyword);
    this.movies = results.map((item) => CardViewModel(cards: item)).toList();
    print(this.movies);
    notifyListeners();
  }

}