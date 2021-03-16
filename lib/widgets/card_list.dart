import 'package:flutter/material.dart';
import 'package:flutter_app_list/view models/card_view_model.dart';

class CardList extends StatelessWidget {

  final List<CardViewModel> cards;

  CardList({this.cards});

  @override
  Widget build(BuildContext context) {
    return this.cards.length !=0 ? ListView.builder(
      itemCount: this.cards.length,
      itemBuilder: (context, index) {

        final movie = this.cards[index];

        return ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: Text(movie.mainId),
          title: Text(movie.name),
        );
      },
    ):Text("null");
  }
}