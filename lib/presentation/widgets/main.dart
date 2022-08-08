import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/presentation/pages/auth/landing.dart';
import 'package:project/presentation/pages/auth/login.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<void> checkLogin() async {
    final pref = await SharedPreferences.getInstance();
    if (pref.getString("userId") == null) {
      goToLanding();
    }
  }

  void goToLanding() {
    context.replaceNamed(LandingPage.routeName);
  }

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _isExpand = false;

  List<Widget> page = [
    const LoginPage(),
    const RegisterPage(),
  ];

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
              builder: (_, notifier, __) => page[notifier.getIndex],
            ),
          )
        ],
      ),
    );
  }
}
