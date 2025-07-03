void main() {
  print("Bắt đầu lấy dữ liệu");
  fecthdata()
      .then((value) {
        print(value);
      })
      .catchError((error) {
        print("Lỗi: $error");
      })
      .whenComplete(() {
        print("Kết thúc lấy dữ liệu");
      });
  print("Loadding...");
}

Future<String> fecthdata() async {
  return Future.delayed(Duration(seconds: 2), () {
    return "đã lấy dữ liệu thành công";
  });
}
