import 'package:flutter/material.dart';

const formInputDecors = InputDecoration(
  fillColor: Color(0xFFfff6e5),
  filled: true,
  errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.redAccent),
      borderRadius: BorderRadius.all(Radius.circular(10.0))
  ),
  enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFb37400)),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10.0),
        bottomRight: Radius.circular(10.0),
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      )
  ),
  focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.amber, width: 2.0),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10.0),
        bottomRight: Radius.circular(10.0),
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      )
  ),
);

const dropDownDecors = InputDecoration(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(color: Colors.amber, width: 2.0)
    )
);

const resetPwdStyle = TextStyle(
    color: Color(0xFFb37400),
    decoration: TextDecoration.underline
);

const appBarTitleStyle = TextStyle(
    color: Color(0xFF2f2f2f),
    fontSize: 18.0,
    fontWeight: FontWeight.bold
);