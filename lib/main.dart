import 'package:flutter/material.dart';

import 'man_hinh_mon_hoc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quản lý học tập sinh viên',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3157D5)),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F7FC),
      ),
      home: const TrangChu(),
    );
  }
}

class TrangChu extends StatefulWidget {
  const TrangChu({super.key});

  @override
  State<TrangChu> createState() => _TrangChuState();
}

class _TrangChuState extends State<TrangChu> {
  @override
  void initState() {
    super.initState();

    // Hiện box thông tin khi mở trang chủ
    WidgetsBinding.instance.addPostFrameCallback((_) {
      hienThiThongTin();
    });
  }

  // Hàm hiển thị box thông tin

  void hienThiThongTin() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFE8E8E8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          contentPadding: const EdgeInsets.all(20),
          content: SizedBox(
            width: 600,
            height: 330,
            child: Stack(
              children: [
                const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'MÔN HỌC: LẬP TRÌNH THIẾT BỊ DI ĐỘNG',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 28),
                      Text(
                        'Đề tài: Quản lý học tập của sinh viên',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 28),
                      Text(
                        'GVHD: ThS. Nguyễn Xuân Quế',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Sinh viên thực hiện:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Nguyễn Tăng Duy - 24100201',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Nguyễn Nghị Đức - 24100503',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // Nút X ở góc trên bên phải
                Positioned(
                  top: -10,
                  right: -10,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close, size: 26),
                    tooltip: 'Đóng',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3157D5),
        foregroundColor: Colors.white,
        title: const Text(
          'Học tập của tôi',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Bạn chưa có thông báo mới')),
              );
            },
            icon: const Icon(Icons.notifications_none),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Xin chào, sinh viên! 👋',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF202B46),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Cùng lên kế hoạch học tập hôm nay nhé.',
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
            const SizedBox(height: 22),

            // Khu vực thống kê
            const Text(
              'Tổng quan học tập',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: TheThongKe(
                    tieuDe: 'Môn học',
                    soLuong: '6',
                    icon: Icons.menu_book_rounded,
                    mau: Colors.blue,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TheThongKe(
                    tieuDe: 'Bài tập',
                    soLuong: '4',
                    icon: Icons.assignment_rounded,
                    mau: Colors.orange,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TheThongKe(
                    tieuDe: 'Lịch thi',
                    soLuong: '2',
                    icon: Icons.event_available_rounded,
                    mau: Colors.purple,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TheThongKe(
                    tieuDe: 'Hoàn thành',
                    soLuong: '75%',
                    icon: Icons.check_circle_rounded,
                    mau: Colors.green,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Các chức năng chính
            const Text(
              'Chức năng chính',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            TheChucNang(
              icon: Icons.book_outlined,
              tieuDe: 'Quản lý môn học',
              moTa: 'Xem danh sách các môn đang học',
              mau: Colors.blue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ManHinhMonHoc(),
                  ),
                );
              },
            ),
            TheChucNang(
              icon: Icons.calendar_month_outlined,
              tieuDe: 'Thời khóa biểu',
              moTa: 'Theo dõi lịch học trong tuần',
              mau: Colors.deepPurple,
              onTap: () => _thongBao('Thời khóa biểu'),
            ),
            TheChucNang(
              icon: Icons.assignment_outlined,
              tieuDe: 'Bài tập và nhiệm vụ',
              moTa: 'Theo dõi bài tập cần hoàn thành',
              mau: Colors.orange,
              onTap: () => _thongBao('Bài tập và nhiệm vụ'),
            ),
            TheChucNang(
              icon: Icons.edit_calendar_outlined,
              tieuDe: 'Lịch thi',
              moTa: 'Xem lịch kiểm tra và lịch thi',
              mau: Colors.green,
              onTap: () => _thongBao('Lịch thi'),
            ),
            TheChucNang(
              icon: Icons.groups_outlined,
              tieuDe: 'Thông tin nhóm',
              moTa: 'Xem thông tin các thành viên',
              mau: Colors.pink,
              onTap: () => _thongBao('Thông tin nhóm'),
            ),

            const SizedBox(height: 20),
            Center(
              child: Text(
                'Ứng dụng hỗ trợ quản lý học tập sinh viên',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Lịch học',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Cá nhân',
          ),
        ],
        onDestinationSelected: (index) {
          if (index != 0) {
            _thongBao(index == 1 ? 'Lịch học' : 'Thông tin cá nhân');
          }
        },
      ),
    );
  }

  // Hàm thông báo khi chọn chức năng
  void _thongBao(String noiDung) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$noiDung - sẽ được xây dựng ở bước tiếp theo')),
    );
  }
}

// Widget hiển thị thông tin thống kê
class TheThongKe extends StatelessWidget {
  final String tieuDe;
  final String soLuong;
  final IconData icon;
  final Color mau;

  const TheThongKe({
    super.key,
    required this.tieuDe,
    required this.soLuong,
    required this.icon,
    required this.mau,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: mau, size: 30),
            const SizedBox(height: 12),
            Text(
              soLuong,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              tieuDe,
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget hiển thị từng chức năng
class TheChucNang extends StatelessWidget {
  final IconData icon;
  final String tieuDe;
  final String moTa;
  final Color mau;
  final VoidCallback onTap;

  const TheChucNang({
    super.key,
    required this.icon,
    required this.tieuDe,
    required this.moTa,
    required this.mau,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: mau.withValues(alpha: 0.12),
          child: Icon(icon, color: mau),
        ),
        title: Text(
          tieuDe,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(moTa),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
