import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teste_flutter/features/customers/entities/customer.entity.dart';
import 'package:teste_flutter/utils/constants/app_icons.constants.dart';
import 'package:teste_flutter/utils/extension_methos/material_extensions_methods.dart';

class CustomerModalCard extends StatelessWidget {
  final CustomerEntity customerEntity;
  const CustomerModalCard({super.key, required this.customerEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: SvgPicture.asset(AppIcons.user),
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                customerEntity.name,
                style: context.textTheme.labelSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              Text(
                customerEntity.phone,
                style: context.textTheme.labelSmall
                    ?.copyWith(fontWeight: FontWeight.w400),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: SvgPicture.asset(
                (!customerEntity.name.toLowerCase().contains('cliente') &&
                        !customerEntity.phone.toLowerCase().contains('não'))
                    ? AppIcons.linkBroken
                    : AppIcons.search),
          ),
        ],
      ),
    );
  }
}
