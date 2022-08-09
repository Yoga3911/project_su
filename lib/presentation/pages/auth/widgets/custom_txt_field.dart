import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/constants/color.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final IconData icon;
  final String label;
  final bool isSecure;
  final String? helper;
  final TextInputType? type;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.icon,
    required this.label,
    required this.isSecure,
    this.helper,
    this.type,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isSecure;
  late Color _color;
  late FocusNode _focusNode;

  @override
  void initState() {
    _isSecure = true;
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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: TextField(
        controller: widget.controller,
        cursorColor: MyColor.blue,
        obscureText: widget.isSecure ? _isSecure : false,
        focusNode: _focusNode,
        keyboardType: widget.type ?? TextInputType.multiline,
        inputFormatters: (widget.label == "Nama Lengkap")
            ? [FilteringTextInputFormatter.allow(RegExp('[A-Za-z0-9,.\' ]'))]
            : [FilteringTextInputFormatter.allow(RegExp('[A-Za-z0-9]'))],
        decoration: InputDecoration(
          helperText: widget.helper,
          labelText: widget.label,
          labelStyle: const TextStyle(
            color: Colors.black,
          ),
          prefixIcon: Icon(
            widget.icon,
            color: _color,
          ),
          suffixIcon: widget.isSecure
              ? IconButton(
                  splashRadius: 25,
                  color: _color,
                  onPressed: () {
                    _isSecure = !_isSecure;
                    setState(() {});
                  },
                  icon: _isSecure
                      ? const Icon(Icons.visibility_off_rounded)
                      : const Icon(Icons.visibility_rounded),
                )
              : null,
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
