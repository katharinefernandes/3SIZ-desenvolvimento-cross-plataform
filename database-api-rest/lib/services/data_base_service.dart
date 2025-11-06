import 'package:myapp/models/todo.dart';
import 'package:myapp/utils/constants.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DataBaseService {
  Future<Database> get _db async {
    return openDatabase(
      join(await getDatabasesPath(), dataBaseName),
      version: 1,
      onCreate: (db, version) {
        return db.execute(scriptCreateTable);
      },
    );
  }

  Future<void> insertTodo(Todo value) async {
    final db = await _db;
    db.insert(
      tableName,
      value.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Todo>> listTodo() async {
    final db = await _db;
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return maps.map((e) => Todo.fromJson(e)).toList();
  }

  Future<void> updateTodo(Todo value) async {
    final db = await _db;
    db.update(tableName, value.toJson(), where: 'id = ?', whereArgs: [value.id]);
  }

  Future<void> deleteTodo(Todo value) async {
    final db = await _db;
    db.delete(tableName, where: 'id = ?', whereArgs: [value.id]);
  }
}
