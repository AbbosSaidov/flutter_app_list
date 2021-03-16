import 'package:flutter/material.dart';
import 'package:flutter_app_list/view models/card_list_view_model.dart';
import 'package:flutter_app_list/view%20models/card_view_model.dart';
import 'package:flutter_app_list/widgets/card_list.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}
class MainPageState extends State<MainPage>{

  var vm=CardlistViewModel();

  @override
  void initState() {
    super.initState();
    vm.fetchCards("asd");
  }
  @override
  Widget build(BuildContext context){
   //  vm = Provider.of<CardlistViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("OK"),
      ),
      body: CardList(cards: vm.movies)
      /*CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Demo'),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],

                  child:Image.asset('assets/images/app_icon.png'), /*ListTile(
                    title: Text('Grid Item $index'),
                    onTap: () {
                      //printSome(index);
                      gethhtp();
                    },
                  ),*/
                );
              },
              childCount: 50,
            ),
          ),
          /*    SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text('List Item $index'),
                );
              },
            ),
          ),*/
        ],
      ),*/
    );
  }

}