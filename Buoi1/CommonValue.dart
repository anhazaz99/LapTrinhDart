void main() {
  var a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89],
      b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
  List<int> ketqua = [];
  for (int i = 0; i < a.length; i++) {
    for (int j = 0; j < b.length; j++) {
      if (a[i] == b[j]) {
        if (!ketqua.contains(a[i])) {
          ketqua.add(a[i]);
        }
        break;
      }
    }
  }
  print("Các Phần Tử Chung Của 2 Danh Sách Là: ");
  ketqua.forEach((action) {
    print(action);
  });
}
