import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:project/constants/color.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'presentation/providers/init.dart';
import 'routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initializeDateFormatting("in_ID", "");
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: MyProvider.data,
      child: Builder(
        builder: (context) {
          final router = context.read<MyRoute>().data;
          return ScreenUtilInit(
            minTextAdapt: true,
            splitScreenMode: true,
            designSize: const Size(393, 786),
            builder: (_, __) => MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: "Sari Nikmat - Web",
              theme: MyColor.theme,
              routeInformationParser: router.routeInformationParser,
              routerDelegate: router.routerDelegate,
              routeInformationProvider: router.routeInformationProvider,
            ),
          );
        },
      ),
    );
  }
}
