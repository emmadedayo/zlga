import 'dart:async';
import 'dart:io';
import 'package:zlga/acadaar_ctrl/config/dr_config.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class DrAppDatabase {
  // A private constructor. Allows us to create instances of AppDatabase
  // only from within the AppDatabase class itself.
  DrAppDatabase._();

  // Singleton instance
  static final DrAppDatabase _singleton = DrAppDatabase._();

  // Singleton accessor
  static DrAppDatabase get instance => _singleton;

  // Completer is used for transforming synchronous code into asynchronous code.
  Completer<Database> _dbOpenCompleter;

  // Database object accessor
  Future<Database> get database async {
    // If completer is null, AppDatabaseClass is newly instantiated, so database is not yet opened
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer<Database>();
      // Calling _openDatabase will also complete the completer with database instance
      _openDatabase();
    }
    // If the database is already opened, awaiting the future will happen instantly.
    // Otherwise, awaiting the returned future will take some time - until complete() is called
    // on the Completer in _openDatabase() below.
    return _dbOpenCompleter.future;
  }

  Future<dynamic> _openDatabase() async {
    // Get a platform-specific directory where persistent app data can be stored
    final Directory appDocumentDir = await getApplicationDocumentsDirectory();
    // Path with the form: /platform-specific-directory/demo.db
    final String dbPath = join(appDocumentDir.path, DrConfig.dr_app_db_name);

    final Database database = await databaseFactoryIo.openDatabase(dbPath);
    // Any code awaiting the Completer's future will now start executing
    _dbOpenCompleter.complete(database);
  }
}
