// coverage:ignore-start

// service locator
import 'package:get_it/get_it.dart';
import 'package:teste_flutter/features/customers/stores/customers.store.dart';
import 'package:teste_flutter/features/tables/stores/tables.store.dart';

final sl = GetIt.I;

void slStores() {
  sl.registerLazySingleton<CustomersStore>(() => CustomersStore());
  sl.registerLazySingleton<TablesStore>(() => TablesStore(sl.get()));
}

void init() {
  slStores();
}
