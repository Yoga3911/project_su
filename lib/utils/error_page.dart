import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final Exception exception;
  const ErrorPage({
    super.key,
    required this.exception,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          exception.toString(),
          style: const TextStyle(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
