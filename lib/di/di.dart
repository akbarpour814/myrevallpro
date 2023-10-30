import 'package:firebase_database/firebase_database.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:revallpro/di/di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() {
  DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  FirebaseDatabase.instance.setPersistenceEnabled(true);
  dbRef.keepSynced(true);
  getIt.registerSingleton<DatabaseReference>(dbRef);
  getIt.init();
}
