import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:flutter_app_list/models/dog.dart';
import 'package:flutter_app_list/models/cards.dart';

class DbOperation{
  Future<Database> openDb() async{
    final database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'errrewtdatabase.db'),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE dogs(id INTEGER PRIMARY KEY, isLoginEnded INTEGER DEFAULT 0, userName TEXT, password TEXT,"
              " userId TEXT, token TEXT)",
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    ) ;
    return database;
  }
  Future<void> insertDog(Dog dog,Database da)async{
    // Get a reference to the database.
    final Database db = await da;

    // Insert the Dog into the correct table. Also specify the
    // `conflictAlgorithm`. In this case, if the same dog is inserted
    // multiple times, it replaces the previous data.
    await db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  Future<List<Dog>> dogs(Database da) async {
    // Get a reference to the database.
    final Database db = await da;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.rawQuery('SELECT password,id,userName,isLoginEnded,userId,token from dogs');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Dog(
        id: maps[i]['id'],
        password: maps[i]['password'],
        userName: maps[i]['userName'],
        isLoginEnded: maps[i]['isLoginEnded'],
        userId: maps[i]['userId'],
        token: maps[i]['token'],
      );
    });
  }
  Future<void> updateDog(Dog dog,Database da) async {
    // Get a reference to the database.
    final db = await da;

    // Update the given Dog.
    await db.update(
      'dogs',
      dog.toMap(),
      // Ensure that the Dog has a matching id.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [dog.id],
    );
  }
  Future<void> deleteDog(int id,Database da)async{
    // Get a reference to the database.
    final db = await da;

    // Remove the Dog from the database.
    await db.delete(
      'dogs',
      // Use a `where` clause to delete a specific dog.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
  Future<Database> openDbCard()async{
    final database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'carddatabase.db'),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE card(id INTEGER PRIMARY KEY, cost INTEGER DEFAULT 0, name TEXT, count INTEGER DEFAULT 0, mainId TEXT)",
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    ) ;
    return database;
  }
  Future<void> insertCard(Cards cardsd,Database da)async{
    // Get a reference to the database.
    final Database db = await da;

    // Insert the Dog into the correct table. Also specify the
    // `conflictAlgorithm`. In this case, if the same dog is inserted
    // multiple times, it replaces the previous data.
    await db.insert(
      'card',
      cardsd.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  Future<List<Cards>> cardss(Database da) async {
    // Get a reference to the database.
    final Database db = await da;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.rawQuery('SELECT cost,id,name,count,mainId from card');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Cards(
        id: maps[i]['id'],
        cost: maps[i]['cost'],
        name: maps[i]['name'],
        count: maps[i]['count'],
        mainId: maps[i]['mainId'],
      );
    });
  }
  Future<void> updateCard(Dog cardd,Database da) async {
    // Get a reference to the database.
    final db = await da;

    // Update the given Dog.
    await db.update(
      'dogs',
      cardd.toMap(),
      // Ensure that the Dog has a matching id.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [cardd.id],
    );
  }
  Future<void> deleteCard(int id,Database da)async{
    // Get a reference to the database.
    final db = await da;

    // Remove the Dog from the database.
    await db.delete(
      'card',
      // Use a `where` clause to delete a specific dog.
      /*  where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],*/
    );
  }
}
