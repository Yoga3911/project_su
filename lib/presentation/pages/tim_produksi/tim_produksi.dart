import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../constants/collection.dart';
import '../../../constants/color.dart';

class TimProduksiPage extends StatefulWidget {
  const TimProduksiPage({super.key});

  @override
  State<TimProduksiPage> createState() => _TimProduksiPageState();
}

class _TimProduksiPageState extends State<TimProduksiPage> {
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
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(right: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            Text(
              "Tim Produksi Sari Nikmat",
              style: TextStyle(fontSize: 24.sp),
            ),
            SizedBox(height: 20.h),
            FutureBuilder<QuerySnapshot>(
              future:
                  MyCollection.users.where("isAdmin", isEqualTo: false).get(),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: MyColor.blue,
                    ),
                  );
                }
                if (snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text(
                      "Tidak ada data",
                      style: TextStyle(
                        fontSize: 20.sp,
                      ),
                    ),
                  );
                }
                final data = snapshot.data!.docs
                    as List<QueryDocumentSnapshot<Map<String, dynamic>>>;
                return Expanded(
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
                                  'Nama',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Tanggal Diterima',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Masa Kerja',
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
                              for (var item in data)
                                DataRow(
                                  cells: [
                                    DataCell(Text(item.id)),
                                    DataCell(Text(item.data()["fullName"])),
                                    DataCell(
                                      Text(
                                        DateFormat('dd-MMMM-yyyy', 'in_ID')
                                            .format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                            item.data()["createdAt"],
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataCell(Text(
                                        "${getMonth(DateTime.fromMillisecondsSinceEpoch(item.data()["createdAt"]), DateTime.now())}")),
                                    DataCell(
                                      IconButton(
                                        onPressed: () {},
                                        splashRadius: 20,
                                        icon: const Icon(Icons.delete_rounded),
                                        color: Colors.red,
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
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

getMonth(DateTime masuk, DateTime sekarang) {
  Duration parse = masuk.difference(sekarang).abs();
  return "${parse.inDays ~/ 360} Tahun ${((parse.inDays % 360) ~/ 30)} Bulan";
}
