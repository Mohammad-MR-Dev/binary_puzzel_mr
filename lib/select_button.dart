import 'package:flutter/material.dart';

class SelectButton extends StatefulWidget {
  final String value;
  const SelectButton({Key? key, required this.value}) : super(key: key);

  @override
  State<SelectButton> createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  isSelected ? Colors.green : Colors.transparent)),
          onPressed: () {
            isSelected = !isSelected;
            setState(() {});
          },
          child: Text(
            widget.value,
            style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 14.0),
          )),
    );
  }
}
