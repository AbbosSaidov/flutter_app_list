import 'package:flutter_app_list/models/cards.dart';


class CardViewModel {

  final Cards cards;

  CardViewModel({this.cards});

  String get mainId {
    return this.cards.mainId;
  }

  int get cost {
    return this.cards.cost;
  }
  int get id {
    return this.cards.id;
  }
  int get count {
    return this.cards.count;
  }
  String get name {
    return this.cards.name;
  }

}