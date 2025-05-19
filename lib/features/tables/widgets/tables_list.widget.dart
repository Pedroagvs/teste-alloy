import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teste_flutter/features/tables/stores/tables.store.dart';
import 'package:teste_flutter/features/tables/widgets/table_card.widget.dart';
import 'package:teste_flutter/injection_container.dart';

class TablesList extends StatelessWidget {
  const TablesList({super.key});

  @override
  Widget build(BuildContext context) {
    final tableStore = sl.get<TablesStore>();
    return Container(
        padding: const EdgeInsets.all(12),
        child: Observer(
          builder: (BuildContext context) {
            return Wrap(
              spacing: 10,
              runSpacing: 10,
              children: tableStore.filteredTables
                  .map(
                    (table) => TableCard(tableEntity: table),
                  )
                  .toList(),
            );
          },
        ));
  }
}
