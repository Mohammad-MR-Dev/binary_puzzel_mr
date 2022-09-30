import 'package:binary_puzzel_mr/select_button.dart';
import 'package:flutter/material.dart';

import 'buttons_keyboard.dart';
import 'count_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Hi , Rinad'),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: const _ScreenBody());
  }
}

class _ScreenBody extends StatefulWidget {
  final String _target = '''
  Miss you in every heart pulse, Without you I'm nothing,
  with you I'm something, but together I have everything.
  Happy birthday rinad, I love you.
  ''';

  final String _q =
      '01001101 01101001 01110011 01110011 00100000 01111001 01101111 01110101 11000010 10100000 01101001 01101110 00100000 01100101 01110110 01100101 01110010 01111001 00100000 01101000 01100101 01100001 01110010 01110100 00100000 01110000 01110101 01101100 01110011 01100101 00100000 00101100 00100000 01010111 01101001 01110100 01101000 01101111 01110101 01110100 00100000 01111001 01101111 01110101 00100000 01001001 00100111 01101101 11000010 10100000 01101110 01101111 01110100 01101000 01101001 01101110 01100111 00101100 01110111 01101001 01110100 01101000 00100000 01111001 01101111 01110101 00100000 01001001 00100111 01101101 00100000 01110011 01101111 01101101 01100101 01110100 01101000 01101001 01101110 01100111 00100000 00101100 00100000 01100010 01110101 01110100 00100000 01110100 01101111 01100111 01100101 01110100 01101000 01100101 01110010 00100000 01001001 00100000 01101000 01100001 01110110 01100101 00100000 01100101 01110110 01100101 01110010 01111001 01110100 01101000 01101001 01101110 01100111 00101110 00100000 01001000 01100001 01110000 01110000 01111001 00100000 01100010 01101001 01110010 01110100 01101000 01100100 01100001 01111001 00100000 01110010 01101001 01101110 01100001 01100100 00101100 01001001 00100000 01101100 01101111 01110110 01100101 00100000 01111001 01101111 01110101 00101110';

  const _ScreenBody({Key? key}) : super(key: key);

  @override
  State<_ScreenBody> createState() => _ScreenBodyState();
}

class _ScreenBodyState extends State<_ScreenBody> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildQ,
            const CountRow(),
            const SizedBox(height: 10.0),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: TextField(
                  controller: textEditingController,
                  readOnly: true,
                  maxLines: 4,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      suffixIcon: _clearButton)),
            ),
            Expanded(
                child: SizedBox(child: ButtonKeyboard(onPressed: _updateText))),
          ],
        ),
      ),
    );
  }

  Widget get _buildQ {
    List<String> values = widget._q.split(' ');
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child:
            Row(children: values.map((e) => SelectButton(value: e)).toList()));
  }

  Widget get _clearButton =>
      IconButton(icon: const Icon(Icons.backspace), onPressed: _clear);

  void _updateText(String val) {
    textEditingController.text += val;
  }

  void _clear() {
    if (textEditingController.text.isEmpty) return;
    String val = textEditingController.text;
    textEditingController.text = val.substring(0, val.length - 1);
  }
}
