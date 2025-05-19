import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_flutter/features/customers/entities/customer.entity.dart';
import 'package:teste_flutter/features/customers/stores/customers.store.dart';
import 'package:teste_flutter/features/customers/widgets/edit_customer_modal.widget.dart';
import 'package:teste_flutter/features/tables/entities/table.entity.dart';
import 'package:teste_flutter/features/tables/stores/tables.store.dart';
import 'package:teste_flutter/features/tables/widgets/customer_modal_card.widget.dart';
import 'package:teste_flutter/features/tables/widgets/customer_selector.widget.dart';
import 'package:teste_flutter/shared/widgets/modal.widget.dart';
import 'package:teste_flutter/shared/widgets/primary_button.widget.dart';
import 'package:teste_flutter/shared/widgets/secondary_button.widget.dart';
import 'package:teste_flutter/utils/extension_methos/material_extensions_methods.dart';

class TableModal extends StatefulWidget {
  final TableEntity? tableEntity;
  const TableModal({super.key, this.tableEntity});
  const TableModal.edit({super.key, required this.tableEntity});
  @override
  State<TableModal> createState() => _TableModalState();
}

class _TableModalState extends State<TableModal> {
  final tableStore = GetIt.I.get<TablesStore>();
  final customerStore = GetIt.I.get<CustomersStore>();
  final FocusNode _minusFocus = FocusNode();
  final FocusNode _plusFocus = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final TextEditingController etTableTitleController;

  bool _handlePlusKeyEvent(KeyEvent event) {
    if (event is KeyDownEvent) {
      final isShiftPressed = HardwareKeyboard.instance.physicalKeysPressed.any(
          (key) =>
              key == PhysicalKeyboardKey.shiftLeft ||
              key == PhysicalKeyboardKey.shiftRight);
      if (event.logicalKey == LogicalKeyboardKey.equal && isShiftPressed ||
          event.logicalKey == LogicalKeyboardKey.add ||
          event.logicalKey == LogicalKeyboardKey.numpadAdd) {
        _addCustomerCard();
        return true;
      }
    }
    return false;
  }

  bool _handleMinusKeyEvent(KeyEvent event) {
    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.minus ||
          event.logicalKey == LogicalKeyboardKey.numpadSubtract) {
        _removeCustomerCard();
        return true;
      }
    }
    return false;
  }

  void _addCustomerCard() {
    final customer = CustomerEntity.empty(
        "Cliente ${tableStore.currentTable.customers.length + 1}");
    tableStore.addCustomer(customer);
  }

  void _removeCustomerCard() {
    if (tableStore.currentTable.customers.isNotEmpty) {
      tableStore.currentTable.customers.removeLast();
    }
  }

  @override
  void initState() {
    tableStore.currentTable = widget.tableEntity ??
        TableEntity(
            id: DateTime.now().millisecondsSinceEpoch,
            identification: 'Mesa ${tableStore.totalTables + 1}',
            customers: []);
    etTableTitleController =
        TextEditingController(text: tableStore.currentTable.identification);
    HardwareKeyboard.instance.addHandler(_handlePlusKeyEvent);
    HardwareKeyboard.instance.addHandler(_handleMinusKeyEvent);

    super.initState();
  }

  @override
  void dispose() {
    _minusFocus.dispose();
    _plusFocus.dispose();
    tableStore.setSelectedCustomer(null);
    HardwareKeyboard.instance.removeHandler(_handlePlusKeyEvent);
    HardwareKeyboard.instance.removeHandler(_handleMinusKeyEvent);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.8,
        child: Form(
          key: formKey,
          child: Modal(
            actions: [
              SecondaryButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  'Voltar',
                ),
              ),
              PrimaryButton(
                onPressed: () {
                  if (tableStore.currentTable.customers.isEmpty) {
                    // TODO implementar aviso de adição de clientes.
                    return;
                  }
                  if (formKey.currentState?.validate() ?? false) {
                    if (widget.tableEntity != null) {
                      tableStore.updateTable(tableStore.currentTable);
                    } else {
                      tableStore.addTable(tableStore.currentTable);
                    }
                    Navigator.of(context).pop();
                  }
                },
                child: const Text(
                  'Salvar',
                ),
              )
            ],
            titlePadding: const EdgeInsets.all(20),
            actionsAlignment: MainAxisAlignment.end,
            width: 400,
            titleWidget: Expanded(
              child: Text.rich(
                softWrap: true,
                TextSpan(
                  children: [
                    const TextSpan(text: 'Editar informações da '),
                    TextSpan(
                      text: tableStore.currentTable.identification.isEmpty
                          ? 'Mesa ${tableStore.totalTables + 1}'
                          : tableStore.currentTable.identification,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            content: [
              TextFormField(
                controller: etTableTitleController,
                maxLength: 25,
                decoration: const InputDecoration(counterText: ''),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo é obrigatório';
                  }
                  return null;
                },
                onChanged: (identification) {
                  tableStore.setCurrentTable(tableStore.currentTable
                      .copyWith(identification: identification));
                },
              ),
              const SizedBox(height: 10),
              Text(
                'Informação temporária para ajudar na identificalção do cliente.',
                style: context.textTheme.labelSmall
                    ?.copyWith(color: context.appColors.darkGrey),
              ),
              const Divider(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Clientes nesta conta',
                    style: context.textTheme.labelMedium,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                'Associe os clientes aos pedidos para salvar o pedido no histórico do cliente, pontuar fidelidade e fazer pagamentos no fiado.',
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.appColors.darkGrey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: TextFormField(
                        readOnly: true,
                        controller: TextEditingController(
                          text: '${tableStore.totalCustomers}',
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Quantidade de pessoas',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.remove,
                      color: context.appColors.darkGrey,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.add,
                      color: context.appColors.darkGrey,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Observer(
                  builder: (_) => ListView.builder(
                    itemCount: tableStore.currentTable.customers.length,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    itemBuilder: (context, index) {
                      return Observer(
                        builder: (_) {
                          final isSelected =
                              tableStore.indexCustomerSelected == index;

                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: isSelected
                                ? CustomerSelector(
                                    nameCustomerSelected: tableStore
                                        .currentTable.customers[index].name,
                                  )
                                : InkWell(
                                    onTap: () {
                                      final isNewCustomer = tableStore
                                              .currentTable
                                              .customers[index]
                                              .id ==
                                          0;
                                      if (isNewCustomer) {
                                        tableStore.setSelectedCustomer(index);
                                      } else {
                                        showDialog(
                                            context: context,
                                            builder: (ctx) {
                                              return EditCustomerModal(
                                                customer: tableStore
                                                    .currentTable
                                                    .customers[index],
                                              );
                                            });
                                      }
                                    },
                                    child: CustomerModalCard(
                                      customerEntity: tableStore
                                          .currentTable.customers[index],
                                    ),
                                  ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              const Divider()
            ],
          ),
        ),
      ),
    );
  }
}
