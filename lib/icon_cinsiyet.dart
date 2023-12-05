import 'package:flutter/material.dart';
import 'package:yasamsuresi/constants.dart';

class MyIcon extends StatelessWidget {
  final IconData sekil;
  final String cinsiyet;
  const MyIcon({Key? key, required this.sekil, required this.cinsiyet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          sekil,
          size: 50,
          color: Colors.black54,
        ),
        const SizedBox(height: 10,),
        Text(
          cinsiyet,
          style: kMetinSitili,
        ),
      ],
    );
  }
}