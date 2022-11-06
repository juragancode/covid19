import 'package:flutter/material.dart';

class SummaryItem extends StatelessWidget {
  SummaryItem(this.title, this.value);

  String title;
  String value;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.all(20),
      elevation: 7,
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue.shade400,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54)),
            Text(value, style: TextStyle(fontSize: 50, color: Colors.white)),
          ],
        )),
      ),
    );
  }
}
