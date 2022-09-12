import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/constants/fonts.dart';
import 'package:project/presentation/pages/pelanggan/widgets/add_product.dart';
import 'package:project/presentation/pages/pelanggan/widgets/edit_product.dart';
import 'package:project/presentation/providers/customer_provider.dart';
import 'package:project/utils/loading.dart';
import 'package:project/utils/snackbar.dart';
import 'package:provider/provider.dart';

import '../../../constants/color.dart';

class PelangganPage extends StatefulWidget {
  const PelangganPage({super.key});

  @override
  State<PelangganPage> createState() => _PelangganPageState();
}

class _PelangganPageState extends State<PelangganPage> {
  late ScrollController _verticalScroll;
  late ScrollController _horizontalScroll;

  @override
  void initState() {
    _verticalScroll = ScrollController();
    _horizontalScroll = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _verticalScroll.dispose();
    _horizontalScroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final customerProv = context.read<CustomerProvider>();
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => const AddCustomerDialog(),
        ),
        label: Row(
          children: [
            const Icon(Icons.add_box_rounded),
            SizedBox(width: 3.w),
            const Text("Tambah"),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            Text(
              "Daftar Harga Produk",
              style: TextStyle(fontSize: 24.sp),
            ),
            SizedBox(height: 20.h),
            FutureBuilder<void>(
              future: customerProv.getAll(),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: MyColor.blue,
                    ),
                  );
                }

                return Consumer<CustomerProvider>(
                  builder: (_, notifier, __) => notifier.getProducts.isEmpty
                      ? Expanded(
                          child: Center(
                            child: Text(
                              "Tidak ada data",
                              style: TextStyle(
                                fontSize: 20.sp,
                              ),
                            ),
                          ),
                        )
                      : Expanded(
                          child: Scrollbar(
                            controller: _verticalScroll,
                            child: Scrollbar(
                              controller: _horizontalScroll,
                              child: SingleChildScrollView(
                                controller: _verticalScroll,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  controller: _horizontalScroll,
                                  child: DataTable(
                                    headingRowColor:
                                        MaterialStateProperty.all(MyColor.blue),
                                    columns: const [
                                      DataColumn(
                                        label: Text(
                                          'ID',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Nama Pelanggan',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Alamat',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'No Telepon',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Kategori Harga',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Aksi',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                    rows: [
                                      for (var item in notifier.getProducts)
                                        if (!item.isDeleted!)
                                          DataRow(
                                            cells: [
                                              DataCell(
                                                Text(item.id!),
                                              ),
                                              DataCell(
                                                Text(
                                                  item.name!,
                                                ),
                                              ),
                                              DataCell(
                                                Text(
                                                  "${item.address} gr",
                                                ),
                                              ),
                                              DataCell(
                                                Text("Rp ${item.telp}"),
                                              ),
                                              DataCell(
                                                Text(
                                                  "Rp ${item.priceCategory}",
                                                ),
                                              ),
                                              DataCell(
                                                Row(
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: () =>
                                                          showDialog(
                                                        context: context,
                                                        builder: (_) =>
                                                            EditCustomerDialog(
                                                          customerModel: item,
                                                        ),
                                                      ),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        backgroundColor:
                                                            Colors.green,
                                                      ),
                                                      child: const Icon(
                                                          Icons.edit_rounded),
                                                    ),
                                                    SizedBox(width: 5.w),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (_) =>
                                                              AlertDialog(
                                                            title: Text(
                                                              "Perhatian!",
                                                              style: TextStyle(
                                                                fontSize: 18.sp,
                                                                fontFamily: MyFont
                                                                    .semiBold,
                                                              ),
                                                            ),
                                                            content: Text(
                                                              "Apakah anda yakin ingin menghapus produk ini?",
                                                              style: TextStyle(
                                                                fontSize: 16.sp,
                                                                fontFamily:
                                                                    MyFont
                                                                        .regular,
                                                              ),
                                                            ),
                                                            actions: [
                                                              ElevatedButton(
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                      5,
                                                                    ),
                                                                  ),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .grey,
                                                                ),
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        context),
                                                                child:
                                                                    const Text(
                                                                  "Batal",
                                                                ),
                                                              ),
                                                              ElevatedButton(
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                      5,
                                                                    ),
                                                                  ),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .red,
                                                                ),
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                    context,
                                                                  );
                                                                  showDialog(
                                                                    context:
                                                                        context,
                                                                    builder: (_) =>
                                                                        const CustomLoading(),
                                                                  );
                                                                  customerProv
                                                                      .delete(
                                                                    customerModel:
                                                                        item,
                                                                  )
                                                                      .then(
                                                                    (value) {
                                                                      Navigator.pop(
                                                                          context);
                                                                      value
                                                                          ? showSnackbar(
                                                                              context,
                                                                              "Produk berhasil dihapus",
                                                                              Colors
                                                                                  .green)
                                                                          : showSnackbar(
                                                                              context,
                                                                              "Produk gagal dihapus",
                                                                              Colors.red);
                                                                    },
                                                                  );
                                                                },
                                                                child:
                                                                    const Text(
                                                                  "Ya",
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        backgroundColor:
                                                            Colors.red,
                                                      ),
                                                      child: const Icon(
                                                        Icons.delete_rounded,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
