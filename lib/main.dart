import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:flutter_app_list/pages/main_page.dart';
import 'db_operation.dart';
import 'package:flutter_app_list/models/dog.dart';
import 'package:flutter_app_list/models/cards.dart';
import 'package:flutter_app_list/view models/card_list_view_model.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (context) => CardlistViewModel(),
        child: MainPage(),
      )
    );
  }
}
/*
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DbOperation db = new DbOperation();

  void printSome(int index){
    debugPrint('movieTitle: $index');
    db.openDb().then((onValue1){
      db.dogs(onValue1).then((onValue3)async{
        if(onValue3!=null && onValue3.length>0){
          debugPrint('dbsucces: $onValue3');
        }else{
          debugPrint('null: $onValue3');

          var fido = new Dog(
            password: 'test',
            userName: 'test',
            userId: 'test',
            token: 'test',
            isLoginEnded: 0,
          );
          db.insertDog(fido,onValue1).then((oiu){
            setState((){});
          });
        }
      });
    });
  }
  Future<void> gethhtp() async {
    var url =
    Uri.https("learnig1.firebaseio.com", '/as/Asd.json');

    await http.get(url,
      headers:{"Content-Type": "application/json"},
    ).then((value){
      debugPrint('http=: '+value.body.toString());
    });
  }
  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: CustomScrollView(
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
      ),
    );
  }
}
*/