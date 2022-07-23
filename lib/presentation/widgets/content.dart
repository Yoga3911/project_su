import 'package:flutter/material.dart';

class MyContent extends StatelessWidget {
  final Widget content;
  const MyContent({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.red,
        child: content,
      ),
    );
  }
}
