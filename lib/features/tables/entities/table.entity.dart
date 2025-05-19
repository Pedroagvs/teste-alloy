import 'package:teste_flutter/features/customers/entities/customer.entity.dart';

class TableEntity {
  TableEntity({
    required this.id,
    required this.identification,
    required this.customers,
  });

  final int id;
  final String identification;
  final List<CustomerEntity> customers;

  TableEntity copyWith({
    String? identification,
    List<CustomerEntity>? customers,
  }) {
    return TableEntity(
      id: id,
      identification: identification ?? this.identification,
      customers: customers ?? this.customers,
    );
  }
}
