import 'package:flutter/material.dart';
import 'package:teste_flutter/features/tables/widgets/tables_header.widget.dart';
import 'package:teste_flutter/features/tables/widgets/tables_list.widget.dart';

class TablesPage extends StatelessWidget {
  const TablesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TablesHeader(),
        Divider(),
        TablesList(),
      ],
    );
  }
}
