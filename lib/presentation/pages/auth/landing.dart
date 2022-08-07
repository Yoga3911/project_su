import 'package:flutter/material.dart';

import 'package:project/presentation/pages/auth/widgets/content.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  static const routeName = "landing_page";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LandingContent(),
    );
  }
}
