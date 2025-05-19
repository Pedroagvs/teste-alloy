// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:teste_flutter/features/customers/entities/customer.entity.dart';
import 'package:teste_flutter/utils/extension_methos/extension_methods.dart';

part 'customers.store.g.dart';

class CustomersStore = _CustomersStoreBase with _$CustomersStore;

abstract class _CustomersStoreBase with Store {
  @observable
  ObservableList<CustomerEntity> customers = ObservableList<CustomerEntity>();

  @computed
  int get totalCustomers => customers.length;

  @observable
  String filter = '';

  @action
  void setFilterCustomer(String value) {
    filter = value;
  }

  @action
  void addCustomer(CustomerEntity customer) {
    customers.add(customer);
  }

  @action
  void removeCustomer(CustomerEntity customer) {
    customers.remove(customer);
  }

  @action
  void updateCustomer(CustomerEntity customer) {
    final index = customers.indexWhere((element) => element.id == customer.id);
    customers[index] = customer;
  }

  @computed
  ObservableList<CustomerEntity> get filteredCustomers {
    if (filter.isEmpty) return ObservableList.of(customers);
    final formatedValue = filter.toLowerCase().removeDiacritics();
    final numericFilter = filter.onlyNumbers();
    return ObservableList.of(customers.where((c) {
      return c.name.toLowerCase().removeDiacritics().contains(formatedValue) ||
          numericFilter.isNotEmpty &&
              c.phone.onlyNumbers().contains(numericFilter);
    }));
  }
}
