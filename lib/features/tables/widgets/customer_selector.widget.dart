import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_flutter/features/customers/stores/customers.store.dart';
import 'package:teste_flutter/features/customers/widgets/edit_customer_modal.widget.dart';
import 'package:teste_flutter/features/tables/stores/tables.store.dart';
import 'package:teste_flutter/utils/constants/app_icons.constants.dart';
import 'package:teste_flutter/utils/extension_methos/material_extensions_methods.dart';

class CustomerSelector extends StatefulWidget {
  final String nameCustomerSelected;
  const CustomerSelector({
    Key? key,
    required this.nameCustomerSelected,
  }) : super(key: key);

  @override
  State<CustomerSelector> createState() => _CustomerSelectorState();
}

class _CustomerSelectorState extends State<CustomerSelector> {
  final LayerLink _layerLink = LayerLink();
  final FocusNode _focusNode = FocusNode();
  late final TextEditingController _controller;

  final tableStore = GetIt.I.get<TablesStore>();
  final customersStore = GetIt.I.get<CustomersStore>();
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.nameCustomerSelected);
    super.initState();

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _showOverlay();
      }
    });

    _controller.addListener(() {
      _removeOverlay();
      _showOverlay();
    });
  }

  void _showOverlay() {
    if (_overlayEntry != null) return;

    final overlay = Overlay.of(context);
    _overlayEntry = _createOverlayEntry();
    overlay.insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox box = context.findRenderObject() as RenderBox;
    final size = box.size;
    final offset = box.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        width: size.width,
        top: offset.dy + size.height + 5,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height + 5),
          child: Material(
            type: MaterialType.canvas,
            borderRadius: BorderRadius.circular(2),
            elevation: 6,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 250),
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: [
                  ListTile(
                    leading: SvgPicture.asset(AppIcons.userAdd),
                    title: Text(
                      "Novo cliente",
                      style: context.textTheme.labelSmall
                          ?.copyWith(color: context.appColors.green),
                    ),
                    subtitle: Text(_controller.text),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (ctx) {
                            return const EditCustomerModal();
                          });
                      _controller.clear();
                      _removeOverlay();
                      FocusScope.of(context).unfocus();
                    },
                  ),
                  ...tableStore.availablesCustomers.map((customer) {
                    return ListTile(
                      leading: SvgPicture.asset(AppIcons.user),
                      title: Text(customer.name),
                      subtitle: Text(
                        customer.phone,
                        style: context.textTheme.labelSmall
                            ?.copyWith(color: context.appColors.darkGrey),
                      ),
                      onTap: () {
                        tableStore
                          ..updateCustomer(customer)
                          ..setSelectedCustomer(null);
                        _controller.text = customer.name;
                        _removeOverlay();
                        FocusScope.of(context).unfocus();
                      },
                    );
                  }).toList()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _removeOverlay();
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextFormField(
        controller: _controller,
        focusNode: _focusNode,
        maxLength: 20,
        onChanged: (value) {
          customersStore.setFilterCustomer(value);
        },
        decoration: InputDecoration(
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              height: 20,
              width: 20,
              child: SvgPicture.asset(AppIcons.search),
            ),
          ),
          prefixIconConstraints:
              const BoxConstraints(maxHeight: 20, minWidth: 20),
          suffixIconConstraints:
              const BoxConstraints(maxHeight: 20, minWidth: 20),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              height: 20,
              width: 20,
              child: SvgPicture.asset(AppIcons.user),
            ),
          ),
          hintText: 'Pesquise por nome ou telefone',
          counterText: '',
          hintStyle: context.textTheme.labelSmall?.copyWith(
            color: context.appColors.darkGrey,
          ),
        ),
      ),
    );
  }
}
