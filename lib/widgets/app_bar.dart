import 'package:flutter/material.dart';

AppBar appBar(BuildContext context, String title){
  return AppBar(
    automaticallyImplyLeading: true,
    iconTheme: IconThemeData(
      color: Colors.black
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: Text(title, style: TextStyle(color: Colors.black),),
    centerTitle: true,
  );
}