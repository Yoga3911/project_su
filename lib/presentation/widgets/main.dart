import 'package:flutter/material.dart';
import 'package:project/presentation/pages/auth/login.dart';
import 'package:project/presentation/pages/auth/register.dart';
import 'package:project/presentation/providers/page_provider.dart';
import 'package:project/presentation/widgets/sidebar.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller = AnimationController(
    vsync: this,
    duration: const Duration(
      milliseconds: 400,
    ),
  );

  bool isExpand = false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedSize(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOutSine,
            child: SizedBox(
              height: size.height,
              width: (isExpand) ? size.width * 0.2 : 0,
              child: (isExpand) ? const MySideNavbar() : null,
            ),
          ),
          IconButton(
            splashRadius: 15,
            icon: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: controller,
            ),
            onPressed: () {
              isExpand = !isExpand;
              isExpand ? controller.forward() : controller.reverse();
              setState(() {});
            },
          ),
          Expanded(
            child: Consumer<PageProvider>(
              builder: (_, notifier, __) => IndexedStack(
                index: notifier.getIndex,
                children: const [
                  LoginPage(),
                  RegisterPage(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
