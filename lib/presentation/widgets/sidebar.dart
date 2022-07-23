import 'package:flutter/material.dart';
import 'package:project/presentation/providers/page_provider.dart';
import 'package:provider/provider.dart';

class MySideNavbar extends StatelessWidget {
  const MySideNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: const Color.fromARGB(255, 255, 200, 0),
      height: size.height,
      width: size.width * 0.2,
      child: Column(
        children: [
          ListTile(
            title: const Text("Login"),
            leading: const Icon(Icons.login_rounded),
            onTap: () {
              context.read<PageProvider>().setIndex = 0;
            },
          ),
          ListTile(
            title: const Text("Register"),
            leading: const Icon(Icons.person_add_rounded),
            onTap: () {
              context.read<PageProvider>().setIndex = 1;
            },
          ),
        ],
      ),
    );
  }
}
