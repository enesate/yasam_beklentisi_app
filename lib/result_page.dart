import 'package:flutter/material.dart';
import 'package:yasamsuresi/constants.dart';
import 'package:yasamsuresi/user_data.dart';
import 'hesap.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;
  const ResultPage(this._userData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sonuç Sayfası',//ss
          style: kMetinSitili,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              flex: 8,
              child: Center(
                  child: Text(
                Hesap(_userData).hesaplama().round().toString(),
                style: kMetinSitili,
              ))),
          Expanded(
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.white
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Geri Dön',
                  style: kMetinSitili,
                ),
              )),
        ],
      ),
    );
  }
}
