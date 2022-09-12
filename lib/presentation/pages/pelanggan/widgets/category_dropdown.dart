import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/presentation/providers/customer_provider.dart';
import 'package:provider/provider.dart';

import '../../../../constants/color.dart';

class PriceCategoryDropdown extends StatelessWidget {
  final TextEditingController controller;
  const PriceCategoryDropdown({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final prov = context.read<CustomerProvider>();
    final data = <ListTile>[
      ListTile(
        leading: const Icon(Icons.format_list_bulleted_rounded),
        title: const Text("Agen"),
        onTap: () {
          controller.text = "Agen";
          prov.setIsTap = !prov.getIsTap;
        },
      ),
      ListTile(
        leading: const Icon(Icons.format_list_bulleted_rounded),
        title: const Text("Distributor"),
        onTap: () {
          controller.text = "Distributor";
          prov.setIsTap = !prov.getIsTap;
        },
      ),
      ListTile(
        leading: const Icon(Icons.format_list_bulleted_rounded),
        title: const Text("Swalayan"),
        onTap: () {
          controller.text = "Swalayan";
          prov.setIsTap = !prov.getIsTap;
        },
      ),
      ListTile(
        leading: const Icon(Icons.format_list_bulleted_rounded),
        title: const Text("Reseller"),
        onTap: () {
          controller.text = "Reseller";
          prov.setIsTap = !prov.getIsTap;
        },
      ),
    ];
    return Consumer<CustomerProvider>(
      builder: (_, notifier, __) => Column(
        children: [
          AnimatedContainer(
            padding: const EdgeInsets.all(5),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOutSine,
            width: double.infinity,
            height: notifier.getIsTap ? 230.h : 0,
            decoration: BoxDecoration(
              color: MyColor.grey,
              borderRadius: BorderRadius.circular(10),
              border: const Border(
                bottom: BorderSide(
                  width: 1,
                  color: MyColor.blue,
                ),
                top: BorderSide(
                  width: 1,
                  color: MyColor.blue,
                ),
                left: BorderSide(
                  width: 1,
                  color: MyColor.blue,
                ),
                right: BorderSide(
                  width: 1,
                  color: MyColor.blue,
                ),
              ),
            ),
            child: ListView(
              children: data,
            ),
          ),
        ],
      ),
    );
  }
}
