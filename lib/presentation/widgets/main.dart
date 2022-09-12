import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/presentation/pages/auth/landing.dart';
import 'package:project/presentation/pages/bahan_baku/bahan_baku.dart';
import 'package:project/presentation/pages/daftar_harga/daftar_harga.dart';
import 'package:project/presentation/pages/pelanggan/pelanggan.dart';
import 'package:project/presentation/pages/produk/produk.dart';
import 'package:project/presentation/pages/salesman/salesman.dart';
import 'package:project/presentation/pages/tim_produksi/tim_produksi.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<bool> checkLogin() async {
    final pref = await SharedPreferences.getInstance();
    if (pref.getString("userId") == null) {
      goToLanding();
      return false;
    }
    return true;
  }

  void goToLanding() {
    context.replaceNamed(LandingPage.routeName);
  }

  @override
  void initState() {
    checkLogin().then(
      (value) {
        value ? FirebaseAuth.instance.signInAnonymously() : null;
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _isExpand = false;

  List<Widget> page = [
    const PelangganPage(),
    const TimProduksiPage(),
    const ProdukPage(),
    const BahanBakuPage(),
    const DaftarHargaPage(),
    const SalesmanPage(),
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
