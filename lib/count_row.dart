import 'package:flutter/material.dart';

class CountRow extends StatefulWidget {
  static int count = 0;

  const CountRow({Key? key}) : super(key: key);

  @override
  State<CountRow> createState() => CountRowState();
}

class CountRowState extends State<CountRow> {
  int count = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text('Solved : ${CountRow.count}');
  }

  static void increment() {
    CountRow.count += 1;
  }

  static void decrement() {
    if (CountRow.count != 0) {
      CountRow.count -= 1;
    }
  }
}
