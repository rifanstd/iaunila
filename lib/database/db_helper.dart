import 'package:iaunila/models/models.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  final String tableName = 'buku_ajar';
  final String id_buku_ajar = 'id_buku_ajar';
  final String judul_buku = 'judul_buku';
  final String isbn = 'isbn';
  final String tanggal_terbit = 'tanggal_terbit';
  final String penerbit = 'penerbit';
  final String waktu_data_ditambahkan = 'waktu_data_ditambahkan';
  final String terakhir_diubah = 'terakhir_diubah';

  // db version
  static const _dbVersion = 1;

  // Constructor
  static final DBHelper _instance = DBHelper._internal();
  DBHelper._internal();

  factory DBHelper() => _instance;

  // create object
  static Database? _database;

  // create db
  Future<void> _onCreate(Database db, int version) async {
    var createBukuAjarTable =
        "CREATE TABLE $tableName ($id_buku_ajar TEXT PRIMARY KEY, "
        "$judul_buku TEXT, "
        "$isbn TEXT, "
        "$tanggal_terbit TEXT, "
        "$penerbit TEXT, "
        "$waktu_data_ditambahkan TEXT, "
        "$terakhir_diubah TEXT)";

    return await db.execute(createBukuAjarTable);
  }

  // initialize database
  Future<Database?> _initDb() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, "iaunila.db");

    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  // Get DB
  Future<Database?> get _db async {
    if (_database != null) {
      return _database;
    }

    _database = await _initDb();
    return _database;
  }

  // add buku ajar to db
  Future<int?> addBukuAjar(BukuAjarModel book) async {
    var dbClient = await _db;
    var result = await dbClient!.insert(tableName, book.toMap());
    print(result.toString());

    return result;
  }

  // get all buku ajar from database
  Future<List<BukuAjarModel>> getAllBukuAjar() async {
    var dbClient = await _db;
    var result = await dbClient!.query(tableName);

    List<BukuAjarModel> books = [];

    books.clear();

    // memasukkan data kedalam model
    // berasarkan data terbaru
    for (int i = result.length-1; i >= 0; i--){
      books.add(BukuAjarModel.fromMap(result[i]));
    }

    return books;
  }

  // delete buku ajar from database
  Future<int?> deleteBukuAjar(String _idBukuAjar) async {
    var dbClient = await _db;
    var result = await dbClient!.delete(tableName,
        where: '$id_buku_ajar = ?', whereArgs: [_idBukuAjar]);

    print(result.toString());

    return result;
  }

  // get one buku ajar
  Future<BukuAjarModel?> getBukuAjar(String _idBukuAjar) async {
    var dbClient = await _db;
    List<Map<String, dynamic>> maps = await dbClient!.query(
      tableName,
      columns: [
        id_buku_ajar,
        judul_buku,
        isbn,
        tanggal_terbit,
        penerbit,
        waktu_data_ditambahkan,
        terakhir_diubah,
      ],
      where: '$id_buku_ajar = ?',
      whereArgs: [_idBukuAjar],
    );

    if (maps.isNotEmpty) {
      return BukuAjarModel.fromMap(maps.first);
    }

    return null;
  }
}
