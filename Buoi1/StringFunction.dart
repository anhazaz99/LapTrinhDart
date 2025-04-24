import 'dart:io';

void DaoChuoi() {
  print("Nhập vào chuỗi cần đảo ngược: ");
  String? chuoi = stdin.readLineSync();
  String ketqua = chuoi!.split("").reversed.join("");
  print("Chuỗi sau khi đảo ngược là: $ketqua");
}

void DemSoLanXuatHien() {
  print("Nhập vào chuỗi cần đếm: ");
  String? chuoi = stdin.readLineSync();
  List<String> chuoi1 = [];
  for (int i = 0; i < chuoi!.length; i++) {
    if (!chuoi1.contains(chuoi[i])) {
      chuoi1.add(chuoi[i]);
    }
  }
  for (int i = 0; i < chuoi1.length; i++) {
    int dem = 0;
    for (int j = 0; j < chuoi.length; j++) {
      if (chuoi[i] == chuoi[j]) {
        dem++;
      }
    }
    print("Kí tự ${chuoi1[i]} xuất hiện $dem lần");
  }
}

void ChuyenThanhChuInHoa() {
  print("Nhập vào chuỗi cần chuyển thành chữ in hoa: ");
  String? chuoi = stdin.readLineSync();
  String ketqua = chuoi!.toUpperCase();
  print("Chuỗi sau khi chuyển thành chữ in hoa là: $ketqua");
}

void main() {
  print("*****************Menu*****************");
  print("1. Đảo Ngược Chuỗi ");
  print("2. Đếm Số Lần Xuất Hiện Của Kí Tự Trong Chuỗi ");
  print("3. Chuyển Thành Chữ In Hoa ");
  print("0. Thoát Chương Trình");
  print("Nhập Lựa Chọn Của Bạn : ");

  while (true) {
    int? luachon = int.parse(stdin.readLineSync()!);
    switch (luachon) {
      case 1:
        DaoChuoi();
        break;
      case 2:
        DemSoLanXuatHien();
        break;
      case 3:
        ChuyenThanhChuInHoa();
        break;
      case 0:
        print("Cảm ơn bạn đã sử dụng chương trình!");
        break;
    }
  }
}
