import 'package:project/presentation/providers/page_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../routes/routes.dart';

class MyProvider {
  MyProvider._();

  static final data = <SingleChildWidget>[
    ChangeNotifierProvider(
      create: (_) => PageProvider(),
    ),
    Provider(
      create: (_) => MyRoute(),
    ),
  ];
}
