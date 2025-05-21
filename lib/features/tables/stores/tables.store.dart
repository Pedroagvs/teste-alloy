// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:teste_flutter/features/customers/entities/customer.entity.dart';
import 'package:teste_flutter/features/customers/stores/customers.store.dart';
import 'package:teste_flutter/features/tables/entities/table.entity.dart';
import 'package:teste_flutter/utils/extension_methos/extension_methods.dart';

part 'tables.store.g.dart';

class TablesStore = _TablesStoreBase with _$TablesStore;

abstract class _TablesStoreBase with Store {
  final CustomersStore _customerStore;
  _TablesStoreBase(this._customerStore);

  @observable
  ObservableList<TableEntity> tables = ObservableList<TableEntity>();

  @observable
  String filter = '';

  @observable
  TableEntity currentTable = TableEntity(
    customers: [],
    id: 0,
    identification: '',
  );

  @observable
  int? indexCustomerSelected;

  @computed
  ObservableList<CustomerEntity> get availablesCustomers {
    final allocatedCustomers = tables
        .expand((t) => t.customers)
        .toList()
        .where((c) => c.id != 0)
        .toList();
    final availablesCustomers = _customerStore.customers
        .where((c) => !allocatedCustomers.contains(c))
        .toList();
    final customers = availablesCustomers
        .where((c) => !currentTable.customers.contains(c))
        .toList();
    return ObservableList<CustomerEntity>.of(customers);
  }

  @computed
  ObservableList<TableEntity> get filteredTables {
    if (filter.isEmpty) {
      return ObservableList.of(tables);
    }

    final formattedFilter = filter.toLowerCase().removeDiacritics();
    final numericFilter = filter.onlyNumbers();

    return ObservableList.of(tables.where((table) {
      final identificationMatch = table.identification
          .toLowerCase()
          .removeDiacritics()
          .contains(formattedFilter);

      final customerMatch = table.customers.any((customer) {
        final nameMatch = customer.name
            .toLowerCase()
            .removeDiacritics()
            .contains(formattedFilter);
        if (numericFilter.isEmpty) return nameMatch;
        final phoneMatch = customer.phone.onlyNumbers().contains(numericFilter);

        return nameMatch || phoneMatch;
      });

      return identificationMatch || customerMatch;
    }));
  }

  @action
  void setFilterTable(String value) {
    filter = value;
  }

  @action
  void setSelectedCustomer(int? index) {
    indexCustomerSelected = index;
  }

  @action
  void setCurrentTable(TableEntity tableEntity) {
    currentTable = tableEntity.copyWith(
        customers: ObservableList.of(tableEntity.customers));
  }

  @action
  void addCustomer(CustomerEntity customerEntity) {
    setCurrentTable(currentTable.copyWith(
      customers: ObservableList.of(currentTable.customers..add(customerEntity)),
    ));
  }

  @action
  void updateCustomer(CustomerEntity customerEntity) {
    if (indexCustomerSelected == null) return;
    final allocatedCustomers = tables.expand((t) => t.customers).toList()
      ..addAll(currentTable.customers);
    final alreadyAllocated =
        allocatedCustomers.any((c) => c.hashCode == customerEntity.hashCode);
    if (alreadyAllocated) {
      // TODO Informar usuário que o cliente já foi alocado para uma mesa.
      return;
    }

    currentTable.customers[indexCustomerSelected!] = customerEntity;
  }

  @action
  void removeLastCustomer() {
    if (currentTable.customers.isEmpty) return;
    setCurrentTable(currentTable.copyWith(
        customers: ObservableList.of(currentTable.customers..removeLast())));
  }

  @computed
  int get totalCustomers => currentTable.customers.length;

  @computed
  int get totalTables => tables.length;

  @action
  void addTable(TableEntity tableEntity) {
    tables.add(tableEntity);
  }

  @action
  void updateTable(TableEntity tableEntity) {
    final index = tables.indexWhere((t) => t.id == tableEntity.id);
    tables[index] = tableEntity;
  }

  @action
  void removeTable(TableEntity tableEntity) {
    tables.remove(tableEntity);
  }
}
