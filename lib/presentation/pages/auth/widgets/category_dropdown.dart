import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/presentation/providers/textfield_provider.dart';
import 'package:provider/provider.dart';

import '../../../../constants/color.dart';

class CategoryDropDown extends StatefulWidget {
  const CategoryDropDown({super.key});

  @override
  State<CategoryDropDown> createState() => _CategoryDropDownState();
}

class _CategoryDropDownState extends State<CategoryDropDown> {
  late Color _color;
  late FocusNode _focusNode;

  @override
  void initState() {
    _color = Colors.grey;
    _focusNode = FocusNode();
    _focusNode.addListener(() => setState(() {
          _color = _focusNode.hasFocus ? MyColor.blue : Colors.grey;
        }));
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final regisProvider = Provider.of<TextFieldRegisterProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: TextField(
        onTap: () {
          regisProvider.setIsTap = !regisProvider.getIsTap;
        },
        readOnly: true,
        focusNode: _focusNode,
        controller: regisProvider.getDesa,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.category_rounded,
            color: _color,
          ),
          filled: true,
          fillColor: MyColor.grey,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: MyColor.blue),
          ),
        ),
      ),
    );
  }
}
