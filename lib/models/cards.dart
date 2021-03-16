class Cards {
  final int id;
  final int cost;
  final String name;
  final int count;
  final String mainId;

  Cards({this.id,this.cost,this.name, this.count,this.mainId});

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'cost': cost,
      'name': name,
      'count': count,
      'mainId': mainId,
    };
  }

  factory Cards.fromJson(Map<String,dynamic> json){
    return Cards(
      id: json["address"],
      cost: json["latitude"],
      name: json["status"],
     // count: json["postal_code"],
      mainId: json["postal_code"],
    );
  }
  @override
  String toString() {
    return 'Cards{id: $id, cost: $cost,name: $name,count: $count,mainId: $mainId}';
  }
}