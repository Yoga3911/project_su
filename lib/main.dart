import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/providers/init.dart';
import 'routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: MyProvider.data,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: MyRoute.data,
        initialRoute: MyRoute.main,
      ),
    );
  }
}
