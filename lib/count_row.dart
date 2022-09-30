import 'package:flutter/material.dart';

class CountRow extends StatefulWidget {
  final int count;

  final int len;
  const CountRow({Key? key, required this.len, required this.count})
      : super(key: key);

  @override
  State<CountRow> createState() => CountRowState();
}

class CountRowState extends State<CountRow> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text('Solved : ${widget.count}/${widget.len}');
  }
}
