import 'package:flutter/material.dart';
import 'package:teste_flutter/utils/extension_methos/material_extensions_methods.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
    super.key,
    required this.onChanged,
    this.tooltip,
    this.placeholder = 'Buscar',
    this.width = 196,
  });

  final Function(String?) onChanged;
  final String placeholder;
  final String? tooltip;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
          suffixIcon: const Padding(
            padding: EdgeInsetsDirectional.only(end: 14),
            child: Icon(Icons.search), // myIcon is a 48px-wide widget.
          ),
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: context.appColors.darkGrey,
          ),
          filled: true,
          fillColor: const Color.fromRGBO(0, 0, 0, 0.06),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
