import 'package:flutter/material.dart';

class ButtonKeyboard extends StatelessWidget {
  final String _data =
      '''Miss you in every heart pulse, Without you I'm nothing,
with you I'm something, but together I have everything.
Happy birthday rinad, I love you.''';

  final Function(String) onPressed;

  const ButtonKeyboard({required this.onPressed, Key? key}) : super(key: key);

  List<String> get keys => _data.codeUnits
      .toSet()
      .toList()
      .map((e) => String.fromCharCode(e))
      .toList();

  @override
  Widget build(BuildContext context) {
    List<String> list = keys;
    list.shuffle();
    return Container(
      margin: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Wrap(
        children: list.map((e) => _button(e)).toList(),
      ),
    );
  }

  Widget _button(String key) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0))),
            elevation: MaterialStateProperty.all(4.0),
            backgroundColor: MaterialStateProperty.all(Colors.grey),
          ),
          onPressed: () => onPressed.call(key),
          child: Text(
            key.codeUnits.contains(10)
                ? 'Enter'
                : key.codeUnits.contains(32)
                    ? 'Space'
                    : key,
            style: const TextStyle(color: Colors.white, fontSize: 18.0),
          )),
    );
  }
}
