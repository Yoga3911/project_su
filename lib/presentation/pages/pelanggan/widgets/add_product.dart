import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/constants/fonts.dart';
import 'package:project/data/models/product/product_model.dart';
import 'package:project/presentation/providers/product_provider.dart';
import 'package:project/utils/loading.dart';
import 'package:project/utils/snackbar.dart';
import 'package:provider/provider.dart';

import '../../../../constants/color.dart';

class AddProductDialog extends StatefulWidget {
  const AddProductDialog({super.key});

  @override
  State<AddProductDialog> createState() => _AddProductDialogState();
}

class _AddProductDialogState extends State<AddProductDialog> {
  late TextEditingController _namaProduk;
  late TextEditingController _netto;
  late TextEditingController _hargaAgen;
  late TextEditingController _hargaDistributor;
  late TextEditingController _hargaSwalayan;
  late TextEditingController _hargaReseller;
  late TextEditingController _hargaKonsumen;

  @override
  void initState() {
    _namaProduk = TextEditingController();
    _netto = TextEditingController();
    _hargaAgen = TextEditingController();
    _hargaDistributor = TextEditingController();
    _hargaSwalayan = TextEditingController();
    _hargaReseller = TextEditingController();
    _hargaKonsumen = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _namaProduk.dispose();
    _netto.dispose();
    _hargaAgen.dispose();
    _hargaDistributor.dispose();
    _hargaSwalayan.dispose();
    _hargaReseller.dispose();
    _hargaKonsumen.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Tambah Produk Baru",
            style: TextStyle(fontSize: 20.sp, fontFamily: MyFont.semiBold),
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.cancel),
            iconSize: 35.r,
            color: Colors.red,
          ),
        ],
      ),
      content: SizedBox(
        width: 150.w,
        child: Column(
          children: [
            TextField(
              controller: _namaProduk,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.shopping_cart_rounded),
                hintText: "Singkong Rebus",
                label: const Text("Nama Produk"),
                filled: true,
                fillColor: MyColor.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: MyColor.blue),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            TextField(
              controller: _netto,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
              ],
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.scale_rounded),
                hintText: "350",
                label: const Text("Netto (Gram)"),
                filled: true,
                fillColor: MyColor.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: MyColor.blue),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            TextField(
              controller: _hargaAgen,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
              ],
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.attach_money_rounded),
                hintText: "10000",
                label: const Text("Harga Agen (Rp)"),
                filled: true,
                fillColor: MyColor.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: MyColor.blue),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            TextField(
              controller: _hargaDistributor,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
              ],
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.attach_money_rounded),
                hintText: "10000",
                label: const Text("Harga Distributor (Rp)"),
                filled: true,
                fillColor: MyColor.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: MyColor.blue),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            TextField(
              controller: _hargaSwalayan,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
              ],
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.attach_money_rounded),
                hintText: "10000",
                label: const Text("Harga Swalayan (Rp)"),
                filled: true,
                fillColor: MyColor.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: MyColor.blue),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            TextField(
              controller: _hargaReseller,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
              ],
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.attach_money_rounded),
                hintText: "10000",
                label: const Text("Harga Reseller (Rp)"),
                filled: true,
                fillColor: MyColor.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: MyColor.blue),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            TextField(
              controller: _hargaKonsumen,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
              ],
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.attach_money_rounded),
                hintText: "10000",
                label: const Text("Harga Konsumen (Rp)"),
                filled: true,
                fillColor: MyColor.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: MyColor.blue),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            backgroundColor: Colors.grey,
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 5.w),
          ),
          child: const Text("Batal"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (_) => const CustomLoading(),
            );
            final dateOnMili = DateTime.now().millisecondsSinceEpoch;
            context
                .read<ProductProvider>()
                .insert(
                  productModel: ProductModel(
                    productName: _namaProduk.text,
                    hargaAgen: int.parse(_hargaAgen.text),
                    hargaDistributor: int.parse(_hargaDistributor.text),
                    hargaSwalayan: int.parse(_hargaSwalayan.text),
                    hargaReseller: int.parse(_hargaKonsumen.text),
                    hargaKonsumen: int.parse(_hargaKonsumen.text),
                    netto: int.parse(_netto.text),
                    createdAt: dateOnMili,
                    updatedAt: dateOnMili,
                  ),
                )
                .then(
              (value) {
                Navigator.pop(context);
                value
                    ? showSnackbar(
                        context,
                        "Produk berhasil ditambahkan",
                        Colors.green,
                      )
                    : showSnackbar(
                        context,
                        "Produk gagal ditambahkan",
                        Colors.red,
                      );
              },
            );
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 5.w),
          ),
          child: const Text("Simpan"),
        ),
      ],
    );
  }
}
