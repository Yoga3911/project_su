import 'package:flutter/material.dart';
import 'package:project/constants/color.dart';
import 'package:project/presentation/providers/textfield_provider.dart';
import 'package:provider/provider.dart';

class DropDownContent extends StatelessWidget {
  const DropDownContent({super.key});

  @override
  Widget build(BuildContext context) {
    final txtFieldProv = context.read<TextFieldRegisterProvider>();

    final data = <ListTile>[
      for (int i = 0; i < txtFieldProv.getDataDesa.length; i++)
        ListTile(
          title: Text("${i + 1}. ${txtFieldProv.getDataDesa[i]}"),
          onTap: () {
            txtFieldProv.setDesa = txtFieldProv.getDataDesa[i];
            txtFieldProv.setIsTap = !txtFieldProv.getIsTap;
          },
        ),
    ];
    return Consumer<TextFieldRegisterProvider>(
      builder: (_, notifier, __) => Column(
        children: [
          AnimatedContainer(
            padding: const EdgeInsets.all(5),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOutSine,
            width: double.infinity,
            height: notifier.getIsTap ? 200 : 0,
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
