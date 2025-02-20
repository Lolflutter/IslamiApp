import 'package:flutter/material.dart';

class TimeCard extends StatelessWidget {
  final String prayer;
  final String time;

  const TimeCard({super.key, required this.prayer, required this.time});

  @override
  Widget build(BuildContext context) {
    String period = int.parse(time.split(":")[0]) >= 12 ? "PM" : "AM";
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xff202020),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Wrap(
            children: [
              Text(
                prayer,
                style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Wrap(
            children: [
              Text(
                time,
                style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Wrap(
            children:[
              Text(
                period,
                style: TextStyle(fontSize: 16, color: Colors.white70),
              )
            ]
          ),
        ],
      ),
    );
  }
}
