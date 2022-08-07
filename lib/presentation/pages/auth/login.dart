import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/presentation/pages/auth/widgets/login_footer.dart';
import 'package:project/presentation/pages/auth/widgets/login_form.dart';
import 'package:project/presentation/providers/textfield_provider.dart';
import 'package:project/utils/animasi_bintang.dart';
import 'package:project/utils/animasi_segienam.dart';
import 'package:project/utils/animasi_segitiga.dart';
import 'package:project/utils/no_glow.dart';
import 'package:provider/provider.dart';

import 'widgets/back_btn.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const routeName = "login_page";

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: CustomBackBtn(
            ctx: context,
          ),
        ),
        body: ChangeNotifierProvider(
          create: (_) => TextFieldLoginProvider(),
          builder: (ctx, _) {
            final txtField = ctx.read<TextFieldLoginProvider>();
            return Stack(
              children: [
                const AnimasiSegiEnam(),
                const AnimasiSegiTiga(),
                const AnimasiBintang(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 100.w,
                    vertical: 10.h,
                  ),
                  child: ScrollConfiguration(
                    behavior: NoGlow(),
                    child: ListView(
                      children: [
                        LoginForm(txtField: txtField, text: text),
                        SizedBox(height: 20.h),
                        LoginFooter(text: text)
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
