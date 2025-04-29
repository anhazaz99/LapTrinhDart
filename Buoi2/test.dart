import 'dart:io';

// Lớp trừu tượng Book
abstract class Book {
  String title;
  String author;
  bool isBorrowed = false;

  Book(this.title, this.author);

  void hienThiThongTin();

  void muonSach() {
    if (!isBorrowed) {
      isBorrowed = true;
      print('✅ Đã mượn sách: $title');
    } else {
      print('⚠️ Sách $title đã được mượn.');
    }
  }

  void traSach() {
    if (isBorrowed) {
      isBorrowed = false;
      print('✅ Đã trả sách: $title');
    } else {
      print('⚠️ Sách $title hiện chưa được mượn.');
    }
  }
}

// Các lớp kế thừa
class SachGiaoKhoa extends Book {
  String monHoc;

  SachGiaoKhoa(String title, String author, this.monHoc) : super(title, author);

  @override
  void hienThiThongTin() {
    print('📘 Sách Giáo Khoa: $title - Tác giả: $author - Môn: $monHoc');
  }
}

class SachThamKhao extends Book {
  String linhVuc;

  SachThamKhao(String title, String author, this.linhVuc)
    : super(title, author);

  @override
  void hienThiThongTin() {
    print('📙 Sách Tham Khảo: $title - Tác giả: $author - Lĩnh vực: $linhVuc');
  }
}

// Lớp SinhVien
class SinhVien {
  String ten;
  List<Book> sachDaMuon = [];

  SinhVien(this.ten);

  void muonSach(Book sach) {
    if (!sach.isBorrowed) {
      sach.muonSach();
      sachDaMuon.add(sach);
    } else {
      print('⚠️ Sách ${sach.title} đã có người mượn.');
    }
  }

  void traSach(Book sach) {
    if (sachDaMuon.contains(sach)) {
      sach.traSach();
      sachDaMuon.remove(sach);
    } else {
      print('⚠️ Bạn không mượn cuốn sách này.');
    }
  }

  void hienThiSachDaMuon() {
    print('📚 Danh sách sách đã mượn của $ten:');
    if (sachDaMuon.isEmpty) {
      print('👉 Chưa mượn cuốn sách nào.');
    } else {
      for (var sach in sachDaMuon) {
        sach.hienThiThongTin();
      }
    }
  }
}

// Hàm chính
void main() {
  List<Book> thuVien = [];
  SinhVien sinhVien = SinhVien('Nguyễn Văn A');

  while (true) {
    print('\n📖📖📖 HỆ THỐNG QUẢN LÝ THƯ VIỆN 📖📖📖');
    print('1. Thêm sách mới');
    print('2. Hiển thị tất cả sách');
    print('3. Sinh viên mượn sách');
    print('4. Sinh viên trả sách');
    print('5. Xem sách đã mượn');
    print('6. Thoát');
    stdout.write('👉 Nhập lựa chọn của bạn: ');
    String? luaChon = stdin.readLineSync();

    switch (luaChon) {
      case '1':
        themSach(thuVien);
        break;
      case '2':
        hienThiThuVien(thuVien);
        break;
      case '3':
        muonSach(thuVien, sinhVien);
        break;
      case '4':
        traSach(thuVien, sinhVien);
        break;
      case '5':
        sinhVien.hienThiSachDaMuon();
        break;
      case '6':
        print('👋 Tạm biệt!');
        return;
      default:
        print('❌ Lựa chọn không hợp lệ.');
    }
  }
}

// Thêm sách
void themSach(List<Book> thuVien) {
  print('--- Thêm sách mới ---');
  stdout.write('Nhập tên sách: ');
  String? tenSach = stdin.readLineSync();
  stdout.write('Nhập tên tác giả: ');
  String? tacGia = stdin.readLineSync();
  stdout.write('Loại sách (1. Giáo khoa, 2. Tham khảo): ');
  String? loai = stdin.readLineSync();

  if (loai == '1') {
    stdout.write('Nhập môn học: ');
    String? monHoc = stdin.readLineSync();
    thuVien.add(SachGiaoKhoa(tenSach ?? '', tacGia ?? '', monHoc ?? ''));
    print('✅ Đã thêm sách giáo khoa.');
  } else if (loai == '2') {
    stdout.write('Nhập lĩnh vực: ');
    String? linhVuc = stdin.readLineSync();
    thuVien.add(SachThamKhao(tenSach ?? '', tacGia ?? '', linhVuc ?? ''));
    print('✅ Đã thêm sách tham khảo.');
  } else {
    print('❌ Lựa chọn loại sách không hợp lệ.');
  }
}

// Hiển thị sách trong thư viện
void hienThiThuVien(List<Book> thuVien) {
  print('--- Danh sách sách trong thư viện ---');
  if (thuVien.isEmpty) {
    print('👉 Thư viện chưa có sách nào.');
  } else {
    for (int i = 0; i < thuVien.length; i++) {
      print('${i + 1}.');
      thuVien[i].hienThiThongTin();
    }
  }
}

// Sinh viên mượn sách
void muonSach(List<Book> thuVien, SinhVien sinhVien) {
  hienThiThuVien(thuVien);
  if (thuVien.isNotEmpty) {
    stdout.write('👉 Nhập số thứ tự sách muốn mượn: ');
    String? index = stdin.readLineSync();
    int idx = int.tryParse(index ?? '') ?? -1;
    if (idx >= 1 && idx <= thuVien.length) {
      sinhVien.muonSach(thuVien[idx - 1]);
    } else {
      print('❌ Số thứ tự không hợp lệ.');
    }
  }
}

// Sinh viên trả sách
void traSach(List<Book> thuVien, SinhVien sinhVien) {
  sinhVien.hienThiSachDaMuon();
  if (sinhVien.sachDaMuon.isNotEmpty) {
    stdout.write('👉 Nhập số thứ tự sách muốn trả: ');
    String? index = stdin.readLineSync();
    int idx = int.tryParse(index ?? '') ?? -1;
    if (idx >= 1 && idx <= sinhVien.sachDaMuon.length) {
      sinhVien.traSach(sinhVien.sachDaMuon[idx - 1]);
    } else {
      print('❌ Số thứ tự không hợp lệ.');
    }
  }
}
