import 'dart:convert';

void main() {
  const jsonString = '''
  {
    "user": {
      "id": 1,
      "name": "Nguyễn Văn A",
      "email": "vana@example.com",
      "address": {
        "street": "123 Đường A",
        "city": "Hà Nội",
        "zipcode": "100000"
      },
      "orders": [
        {
          "id": 101,
          "product": "Laptop",
          "price": 15000000
        },
        {
          "id": 102,
          "product": "Chuột không dây",
          "price": 500000
        }
      ]
    }
  }
  ''';

  final data = jsonDecode(jsonString);

  final user = data['user'];
  final name = user['name'];
  final city = user['address']['city'];
  final orders = user['orders'];

  print("Tên người dùng: $name");
  print("Thành phố: $city");
  print("Danh sách sản phẩm đã mua:");

  for (var order in orders) {
    final product = order['product'];
    final price = order['price'];
    print("- $product: ${price} VND");
  }
}
