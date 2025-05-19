class CustomerEntity {
  final int id;
  final String name;
  final String phone;

  CustomerEntity({
    required this.id,
    required this.name,
    required this.phone,
  });

  const CustomerEntity.empty(this.name)
      : id = 0,
        phone = 'Não informado';

  CustomerEntity copyWith({
    String? name,
    String? phone,
  }) {
    return CustomerEntity(
      id: id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
    );
  }
}
