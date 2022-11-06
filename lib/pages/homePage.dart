import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widgets/summaryItem.dart';
import '../models/summaryModel.dart';

class HomePage extends StatelessWidget {
  late Summary dataSummary;

  Future getSummary() async {
    var response = await http.get(
      Uri.parse("https://covid19.mathdro.id/api"),
    );
    Map<String, dynamic> data =
        json.decode(response.body) as Map<String, dynamic>;
    dataSummary = Summary.fromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Summary"),
      ),
      body: FutureBuilder(
        future: getSummary(),
        builder: (context, AsyncSnapshot) {
          if (AsyncSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text(
                "LOADING 🟢🟡🔴",
                style: TextStyle(fontSize: 36),
              ),
            );
          }
          return Column(
            children: [
              SummaryItem("Confirmed", "${dataSummary.confirmed.value}"),
              SummaryItem("Deaths", "${dataSummary.deaths.value}"),
            ],
          );
        },
      ),
    );
  }
}
