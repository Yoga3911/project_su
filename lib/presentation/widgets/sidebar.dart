import 'package:flutter/material.dart';
import 'package:project/constants/color.dart';
import 'package:project/constants/fonts.dart';
import 'package:provider/provider.dart';

import '../../presentation/providers/page_provider.dart';

class MySideNavbar extends StatelessWidget {
  const MySideNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: MyColor.blue,
      height: size.height,
      width: size.width * 0.2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Consumer<PageProvider>(
                builder: (_, notifier, __) => Material(
                  type: MaterialType.transparency,
                  child: MouseRegion(
                    onEnter: (e) {
                      notifier.setHover1 = true;
                    },
                    onExit: (e) {
                      notifier.setHover1 = false;
                    },
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hoverColor: notifier.getHover1
                          ? const Color.fromARGB(255, 107, 196, 255)
                          : MyColor.blue,
                      tileColor: notifier.getSelect1
                          ? const Color.fromARGB(202, 119, 200, 254)
                          : MyColor.blue,
                      title: const Text(
                        "Login",
                        style: TextStyle(
                          fontFamily: MyFont.semiBold,
                          color: Colors.white,
                        ),
                      ),
                      leading: const Icon(
                        Icons.login_rounded,
                        color: Colors.white,
                      ),
                      onTap: () {
                        context.read<PageProvider>().setIndex = 0;
                        notifier.setSelect1 = true;
                        notifier.setSelect2 = false;
                      },
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Consumer<PageProvider>(
                builder: (_, notifier, __) => Material(
                  type: MaterialType.transparency,
                  child: MouseRegion(
                    onEnter: (e) {
                      notifier.setHover2 = true;
                    },
                    onExit: (e) {
                      notifier.setHover2 = false;
                    },
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hoverColor: notifier.getHover2
                          ? const Color.fromARGB(255, 107, 196, 255)
                          : MyColor.blue,
                      tileColor: notifier.getSelect2
                          ? const Color.fromARGB(202, 119, 200, 254)
                          : MyColor.blue,
                      title: const Text(
                        "Register",
                        style: TextStyle(
                          fontFamily: MyFont.semiBold,
                          color: Colors.white,
                        ),
                      ),
                      leading: const Icon(
                        Icons.person_add_rounded,
                        color: Colors.white,
                      ),
                      onTap: () {
                        context.read<PageProvider>().setIndex = 1;
                        notifier.setSelect1 = false;
                        notifier.setSelect2 = true;
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
