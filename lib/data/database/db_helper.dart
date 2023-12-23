import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:note/core/fpdarts.dart';
import 'package:note/data/model/categories/category.dart';
import 'package:note/data/model/error_detail.dart';
import 'package:note/data/model/note/note.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  late Database _database;

  Future<void> initDatabase() async {
    Directory dbDirectory = await getApplicationDocumentsDirectory();
    String path = join(dbDirectory.path, 'note.db');
    print(path);
    _database = await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Note(
        id INTEGER PRIMARY KEY,
        title TEXT
        todoList TEXT
        noteContents TEXT
        password TEXT
      )
  ''');

    await db.execute('''
      CREATE TABLE Categories(
        id INTEGER PRIMARY KEY,
        name TEXT
      )
  ''');
  }

  TaskEither<ErrorDetail, int> insertNote({required Note note}) {
    return tryCatchE(
      () async {
        final result = await _database.insert('Note', note.toJson());
        return right(result);
      },
      (error, stackTrace) => const ErrorDetail.fatal(),
    );
  }

  TaskEither<ErrorDetail, int> insertCategory({required Category category}) {
    return tryCatchE(
      () async {
        final result = await _database.insert('Categories', category.toJson());
        return right(result);
      },
      (error, stackTrace) => const ErrorDetail.fatal(),
    );
  }
}
