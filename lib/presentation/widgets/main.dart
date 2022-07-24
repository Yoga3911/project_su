import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../presentation/pages/auth/register.dart';
import '../../presentation/providers/page_provider.dart';
import '../../presentation/widgets/sidebar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const routeName = "main-page";

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(
      milliseconds: 400,
    ),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _isExpand = false;
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
              width: (_isExpand) ? size.width * 0.2 : 0,
              child: (_isExpand) ? const MySideNavbar() : null,
            ),
          ),
          IconButton(
            splashRadius: 15,
            icon: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _controller,
            ),
            onPressed: () {
              _isExpand = !_isExpand;
              _isExpand ? _controller.forward() : _controller.reverse();
              setState(() {});
            },
          ),
          Expanded(
            child: Consumer<PageProvider>(
              builder: (_, notifier, __) => IndexedStack(
                index: notifier.getIndex,
                children: const [
                  // LoginPage(),
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
