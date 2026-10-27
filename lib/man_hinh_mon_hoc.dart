import 'package:flutter/material.dart';

class ManHinhMonHoc extends StatefulWidget {
  const ManHinhMonHoc({super.key});

  @override
  State<ManHinhMonHoc> createState() => _ManHinhMonHocState();
}

class _ManHinhMonHocState extends State<ManHinhMonHoc> {
  // Danh sách môn học mẫu
  List<String> danhSachMonHoc = [
    'Lập trình Flutter',
    'Cơ sở dữ liệu',
    'Lập trình hướng đối tượng',
  ];

  // Ô nhập tên môn học
  final TextEditingController tenMonHoc = TextEditingController();

  // Hàm thêm môn học
  void themMonHoc() {
    if (tenMonHoc.text.isNotEmpty) {
      setState(() {
        danhSachMonHoc.add(tenMonHoc.text);
      });

      tenMonHoc.clear();
    }
  }

  // Hàm xóa môn học
  void xoaMonHoc(int index) {
    setState(() {
      danhSachMonHoc.removeAt(index);
    });
  }

  @override
  void dispose() {
    tenMonHoc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý môn học'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: tenMonHoc,
              decoration: const InputDecoration(
                labelText: 'Nhập tên môn học',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: themMonHoc,
                child: const Text('Thêm môn học'),
              ),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Danh sách môn học',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: danhSachMonHoc.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.book, color: Colors.blue),
                      title: Text(danhSachMonHoc[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          xoaMonHoc(index);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
