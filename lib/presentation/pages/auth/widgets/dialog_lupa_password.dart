import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/constants/fonts.dart';
import 'package:project/presentation/providers/textfield_provider.dart';
import 'package:project/presentation/providers/user_provider.dart';
import 'package:project/utils/loading.dart';
import 'package:provider/provider.dart';

import 'custom_txt_field.dart';

class ForgotPasswordDialog extends StatelessWidget {
  final TextFieldLoginProvider txtField;
  const ForgotPasswordDialog({
    super.key,
    required this.txtField,
  });

  Future<bool> validasi(BuildContext context) async {
    if (txtField.getUsername2.text.isEmpty ||
        txtField.getPassword2.text.isEmpty ||
        txtField.getPassword3.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Tidak boleh ada data yang kosong"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5),
        ),
      );
      return false;
    } else if (txtField.getPassword2.text.length < 8 ||
        txtField.getPassword3.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Kata sandi minimal 8 karakter"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5),
        ),
      );
      return false;
    } else if (txtField.getPassword2.text != txtField.getPassword3.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Kata sandi dam Konfirmasi kata sandi tidak sama"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5),
        ),
      );
      return false;
    }

    return true;
  }

  void clearTextFieldVal() {
    txtField.getUsername2.clear();
    txtField.getPassword2.clear();
    txtField.getPassword3.clear();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: size.width * 0.5,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Material(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Lupa Kata Sandi",
                  style: TextStyle(
                    fontFamily: MyFont.semiBold,
                    fontSize: 24.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  icon: Icons.person_rounded,
                  label: "Nama Pengguna",
                  isSecure: false,
                  controller: txtField.getUsername2,
                  helper: null,
                ),
                CustomTextField(
                  icon: Icons.lock_rounded,
                  label: "Kata Sandi Baru",
                  isSecure: true,
                  controller: txtField.getPassword2,
                  helper: null,
                ),
                CustomTextField(
                  icon: Icons.lock_rounded,
                  label: "Konfirmasi Kata Sandi",
                  isSecure: true,
                  controller: txtField.getPassword3,
                  helper: null,
                ),
                SizedBox(height: 30.h),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 20.h,
                            horizontal: 10.w,
                          ),
                          backgroundColor: Colors.grey,
                        ),
                        child: const Text("Kembali"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) => const CustomLoading(),
                          );
                          validasi(context).then(
                            (value) {
                              if (!value) {
                                Navigator.pop(context);
                                Navigator.pop(context);
                                return;
                              }
                              context
                                  .read<UserProvider>()
                                  .forgotPassword(
                                    username: txtField.getUsername2.text,
                                    password: txtField.getPassword2.text,
                                  )
                                  .then(
                                (value) {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  if (!value) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text("Kata Sandi gagal diubah"),
                                        backgroundColor: Colors.red,
                                        duration: Duration(seconds: 4),
                                      ),
                                    );
                                    return;
                                  }
                                  clearTextFieldVal();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text("Kata Sandi berhasil diubah"),
                                      backgroundColor: Colors.green,
                                      duration: Duration(seconds: 3),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 20.h,
                            horizontal: 10.w,
                          ),
                        ),
                        child: const Text("Konfirmasi"),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
