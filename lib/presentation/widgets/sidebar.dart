import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:project/constants/color.dart';
import 'package:project/constants/fonts.dart';
import 'package:project/presentation/pages/auth/landing.dart';
import 'package:project/presentation/providers/user_provider.dart';
import 'package:project/utils/loading.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../presentation/providers/page_provider.dart';

class MySideNavbar extends StatelessWidget {
  const MySideNavbar({super.key});

  Future<void> clearStorage() async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
  }

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
            Expanded(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/bakpao.png",
                            height: 50.h,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "Sari Nikmat",
                            style: TextStyle(
                              fontFamily: MyFont.lobstre,
                              fontSize: 24.sp,
                              color: Colors.white,
                            ),
                          )
                        ],
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
                              "Pelanggan",
                              style: TextStyle(
                                fontFamily: MyFont.semiBold,
                                color: Colors.white,
                              ),
                            ),
                            leading: const Icon(
                              Icons.person_rounded,
                              color: Colors.white,
                            ),
                            onTap: () {
                              context.read<PageProvider>().setIndex = 0;
                              notifier.setSelect1 = true;
                              notifier.setSelect2 = false;
                              notifier.setSelect3 = false;
                              notifier.setSelect4 = false;
                              notifier.setSelect5 = false;
                              notifier.setSelect6 = false;
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
                              "Tim Produksi",
                              style: TextStyle(
                                fontFamily: MyFont.semiBold,
                                color: Colors.white,
                              ),
                            ),
                            leading: const Icon(
                              Icons.group_rounded,
                              color: Colors.white,
                            ),
                            onTap: () {
                              context.read<PageProvider>().setIndex = 1;
                              notifier.setSelect1 = false;
                              notifier.setSelect2 = true;
                              notifier.setSelect3 = false;
                              notifier.setSelect4 = false;
                              notifier.setSelect5 = false;
                              notifier.setSelect6 = false;
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
                            notifier.setHover3 = true;
                          },
                          onExit: (e) {
                            notifier.setHover3 = false;
                          },
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            hoverColor: notifier.getHover3
                                ? const Color.fromARGB(255, 107, 196, 255)
                                : MyColor.blue,
                            tileColor: notifier.getSelect3
                                ? const Color.fromARGB(202, 119, 200, 254)
                                : MyColor.blue,
                            title: const Text(
                              "Produk",
                              style: TextStyle(
                                fontFamily: MyFont.semiBold,
                                color: Colors.white,
                              ),
                            ),
                            leading: const Icon(
                              Icons.fastfood_rounded,
                              color: Colors.white,
                            ),
                            onTap: () {
                              context.read<PageProvider>().setIndex = 2;
                              notifier.setSelect1 = false;
                              notifier.setSelect2 = false;
                              notifier.setSelect3 = true;
                              notifier.setSelect4 = false;
                              notifier.setSelect5 = false;
                              notifier.setSelect6 = false;
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
                            notifier.setHover4 = true;
                          },
                          onExit: (e) {
                            notifier.setHover4 = false;
                          },
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            hoverColor: notifier.getHover4
                                ? const Color.fromARGB(255, 107, 196, 255)
                                : MyColor.blue,
                            tileColor: notifier.getSelect4
                                ? const Color.fromARGB(202, 119, 200, 254)
                                : MyColor.blue,
                            title: const Text(
                              "Bahan Baku",
                              style: TextStyle(
                                fontFamily: MyFont.semiBold,
                                color: Colors.white,
                              ),
                            ),
                            leading: const Icon(
                              Icons.warehouse_rounded,
                              color: Colors.white,
                            ),
                            onTap: () {
                              context.read<PageProvider>().setIndex = 3;
                              notifier.setSelect1 = false;
                              notifier.setSelect2 = false;
                              notifier.setSelect3 = false;
                              notifier.setSelect4 = true;
                              notifier.setSelect5 = false;
                              notifier.setSelect6 = false;
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
                            notifier.setHover5 = true;
                          },
                          onExit: (e) {
                            notifier.setHover5 = false;
                          },
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            hoverColor: notifier.getHover5
                                ? const Color.fromARGB(255, 107, 196, 255)
                                : MyColor.blue,
                            tileColor: notifier.getSelect5
                                ? const Color.fromARGB(202, 119, 200, 254)
                                : MyColor.blue,
                            title: const Text(
                              "Daftar Harga",
                              style: TextStyle(
                                fontFamily: MyFont.semiBold,
                                color: Colors.white,
                              ),
                            ),
                            leading: const Icon(
                              Icons.price_change_rounded,
                              color: Colors.white,
                            ),
                            onTap: () {
                              context.read<PageProvider>().setIndex = 4;
                              notifier.setSelect1 = false;
                              notifier.setSelect2 = false;
                              notifier.setSelect3 = false;
                              notifier.setSelect4 = false;
                              notifier.setSelect5 = true;
                              notifier.setSelect6 = false;
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
                            notifier.setHover6 = true;
                          },
                          onExit: (e) {
                            notifier.setHover6 = false;
                          },
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            hoverColor: notifier.getHover6
                                ? const Color.fromARGB(255, 107, 196, 255)
                                : MyColor.blue,
                            tileColor: notifier.getSelect6
                                ? const Color.fromARGB(202, 119, 200, 254)
                                : MyColor.blue,
                            title: const Text(
                              "Salesman",
                              style: TextStyle(
                                fontFamily: MyFont.semiBold,
                                color: Colors.white,
                              ),
                            ),
                            leading: const Icon(
                              Icons.man_rounded,
                              color: Colors.white,
                            ),
                            onTap: () {
                              context.read<PageProvider>().setIndex = 5;
                              notifier.setSelect1 = false;
                              notifier.setSelect2 = false;
                              notifier.setSelect3 = false;
                              notifier.setSelect4 = false;
                              notifier.setSelect5 = false;
                              notifier.setSelect6 = true;
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder(
              future: context.read<UserProvider>().getById(),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox();
                }
                final user = context.read<UserProvider>().getUser!;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30.r,
                            backgroundColor: Colors.white,
                            backgroundImage: user.isAdmin
                                ? const AssetImage("assets/images/admin.png")
                                : const AssetImage("assets/images/profile.png"),
                          ),
                          SizedBox(width: 5.w),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user.fullName,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: MyFont.semiBold,
                                    fontSize: 18.sp,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  user.isAdmin ? "Admin" : "Tim Produksi",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: MyFont.regular,
                                    fontSize: 16.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Material(
                      type: MaterialType.transparency,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(5),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => const CustomLoading(),
                          );
                          clearStorage();
                          FirebaseAuth.instance.signOut().then(
                                (_) => context.goNamed(
                                  LandingPage.routeName,
                                ),
                              );
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10.r),
                          child: const Icon(
                            Icons.logout_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 10.h)
          ],
        ),
      ),
    );
  }
}
