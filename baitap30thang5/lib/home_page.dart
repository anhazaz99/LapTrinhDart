import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Text("HomePage"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            taskCard("Đỗ Văn Anh", "Ngày 1", "Chạy Bộ 1000km", Colors.blue),
            taskCard(
              "Đỗ Văn Anh",
              "Ngày 2",
              "Chống đẩy 1000 cái",
              Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  Widget taskCard(String name, String date, String task, Color borderColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(name), Text(date)],
          ),
          const SizedBox(height: 20),
          const Divider(),
          Row(children: [Text(task)]),
        ],
      ),
    );
  }
}
