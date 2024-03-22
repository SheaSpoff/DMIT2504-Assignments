// ignore_for_file: todo, avoid_print, library_prefixes, avoid_function_literals_in_foreach_calls, file_names, unused_import

import 'package:path/path.dart' as pathPackage;
import 'package:sqflite/sqflite.dart' as sqflitePackage;
import 'package:path_provider/path_provider.dart';

class SQFliteDbService {
  sqflitePackage.Database? db;
  late String path;

  Future<void> getOrCreateDatabaseHandle() async {
    try {
      //TODO: Put your code here to complete this method.
      if (db != null) {
        return;
      }

      var applicationSupportDirectory = await getApplicationSupportDirectory();
      path = pathPackage.join(applicationSupportDirectory.path, 'stocks.db');

      db = await sqflitePackage.openDatabase(path, version: 1,
          onCreate: (sqflitePackage.Database db, int version) async {
        await db.execute('''
          CREATE TABLE stocks (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            quantity INTEGER,
            price REAL
          )
        ''');
      });
    } catch (e) {
      print('SQFliteDbService getOrCreateDatabaseHandle: $e');
    }
  }

  Future<void> printAllStocksInDbToConsole() async {
    try {
      //TODO: Put your code here to complete this method.
      await getOrCreateDatabaseHandle();
      List<Map<String, dynamic>> stocks = await db!.query('stocks');
      print(stocks);
    } catch (e) {
      print('SQFliteDbService printAllStocksInDbToConsole: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getAllStocksFromDb() async {
    try {
      //TODO: Put your code here to complete this method.
      // Replace this return with valid data.
      await getOrCreateDatabaseHandle();
      List<Map<String, dynamic>> stocks = await db!.query('stocks');
      return stocks;
    } catch (e) {
      print('SQFliteDbService getAllStocksFromDb: $e');
      return <Map<String, dynamic>>[];
    }
  }

  Future<void> deleteDb() async {
    try {
      //TODO: Put your code here to implement this method.
      await getOrCreateDatabaseHandle();
      await sqflitePackage.deleteDatabase(path);
      print('Database deleted successfully');
    } catch (e) {
      print('SQFliteDbService deleteDb: $e');
    }
  }

  Future<void> insertStock(Map<String, dynamic> stock) async {
    try {
      //TODO: 
      //Put code here to insert a stock into the database.
      //Insert the Stock into the correct table. 
      //Also specify the conflictAlgorithm. 
      //In this case, if the same stock is inserted
      //multiple times, it replaces the previous data.
      await getOrCreateDatabaseHandle();
      await db!.insert(
        'stocks',
        stock,
        conflictAlgorithm: sqflitePackage.ConflictAlgorithm.replace,
      );
    } catch (e) {
      print('SQFliteDbService insertStock: $e');
    }
  }

  Future<void> updateStock(Map<String, dynamic> stock) async {
    try {
      //TODO: 
      //Put code here to update stock info.
      await getOrCreateDatabaseHandle();
      await db!.update(
        'stocks',
        stock,
        where: 'id = ?',
        whereArgs: [stock['id']],
      );
    } catch (e) {
      print('SQFliteDbService updateStock: $e');
    }
  }

  Future<void> deleteStock(Map<String, dynamic> stock) async {
    try {
      //TODO: 
      //Put code here to delete a stock from the database.
      await getOrCreateDatabaseHandle();
      await db!.delete(
        'stocks',
        where: 'id = ?',
        whereArgs: [stock['id']],
      );
    } catch (e) {
      print('SQFliteDbService deleteStock: $e');
    }
  }
}
