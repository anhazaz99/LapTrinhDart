import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sự Kiện')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Card 1
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.event,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
                title: Text('Sự kiện công nghệ'),
                subtitle: Text('Thứ 2, ngày 24 tháng 6'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),
            SizedBox(height: 16),

            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.celebration,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
                title: Text('Sự kiện ra mắt Iphone'),
                subtitle: Text('Thứ 7, ngày 29 tháng 6'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // xử lý khi nhấn vào
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
