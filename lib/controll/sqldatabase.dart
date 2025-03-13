// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:sqflite/sqlite_api.dart';
// import 'package:streamt/model/databasemodel.dart';

// class DatabaseService{
//   static Database? _db; 
//   static final DatabaseService instance = DatabaseService._constructor();

//   DatabaseService._constructor();

//   Future<Database> get database async{
//     if (_db != null) return _db!;
//     _db = await getDatabase();
//     return _db!;



//   }

//   Future<Database> getDatabase() async{
//     final databaseDirpath = await getDatabasesPath();
//     final databasepath = join(databaseDirpath,"master_db.db");
//     return await  openDatabase(databasepath,version: 1,
//     onCreate: (db, version) async{
//       await db.execute('''
//       CREATE TABLE items (
//         id INTEGER PRIMARY KEY ,
//         name TEXT NOT NULL,
//         email TEXT NOT NULL,
//         location TEXT NOT NULL
//       )

// '''
//       );
      
//     },
    
//     );
    
//   }

//   Future<int>insertiteme(data item)async{
//     final db = await database;
//     return await db.insert("item",item.toMap());
//   }

//   Future<List<data>> getitems()async{
//     final db = await database;
//     final List<Map<String, dynamic>> maps = await db.query('item');
//   return maps.map((map)=> data.fromMap(map)).toList();
//   }
// }

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:streamt/model/databasemodel.dart';

class DatabaseService {
  static Database? _db; 
  static final DatabaseService instance = DatabaseService._constructor();

  DatabaseService._constructor();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async {
    final databaseDirpath = await getDatabasesPath();
    final databasepath = join(databaseDirpath, "master_db.db");
    return await openDatabase(
      databasepath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE items (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            email TEXT NOT NULL,
            location TEXT NOT NULL,
            imagePath TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertItem(data item) async {
    final db = await database;
    return await db.insert("items", item.toMap()); // Corrected to "items"
  }

  Future<List<data>> getItems() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('items'); // Corrected to "items"
    return maps.map((map) => data.fromMap(map)).toList();
  }
}
