import 'package:flutter/material.dart';

TextStyle kMetinSitili = const TextStyle(
  color: Colors.black54,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

TextStyle kSayiSitili = const TextStyle(
  color: Colors.lightBlue,
  fontSize: 30,
  fontWeight: FontWeight.bold,
);

ButtonStyle kOutlineButton = OutlinedButton.styleFrom(
  foregroundColor: Colors.black54,
  minimumSize: const Size(36, 36),
  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2))),
  side: const BorderSide(color: Colors.blue, width: 2),
);
