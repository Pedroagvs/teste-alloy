import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_flutter/features/customers/stores/customers.store.dart';
import 'package:teste_flutter/features/tables/stores/tables.store.dart';
import 'package:teste_flutter/features/tables/widgets/customers_counter.widget.dart';
import 'package:teste_flutter/features/tables/widgets/table_modal.widget.dart';
import 'package:teste_flutter/shared/widgets/search_input.widget.dart';
import 'package:teste_flutter/utils/extension_methos/material_extensions_methods.dart';

class TablesHeader extends StatefulWidget {
  const TablesHeader({super.key});

  @override
  State<TablesHeader> createState() => _TablesHeaderState();
}

class _TablesHeaderState extends State<TablesHeader> {
  final consumerStore = GetIt.I.get<CustomersStore>();
  final tableStore = GetIt.I.get<TablesStore>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            Text(
              'Mesas',
              style: context.textTheme.titleLarge,
            ),
            const SizedBox(width: 20),
            SearchInput(
              onChanged: (value) => tableStore.setFilterTable(value ?? ''),
            ),
            const SizedBox(width: 20),
            Observer(
                builder: (ctx) =>
                    CustomersCounter(label: '${consumerStore.totalCustomers}')),
            const SizedBox(width: 20),
            FloatingActionButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return const TableModal();
                    });
              },
              tooltip: 'Criar nova mesa',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
