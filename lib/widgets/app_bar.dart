import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar appBar(BuildContext context, String title, bool isHome){
    return AppBar(
      leading: !isHome?(Platform.isAndroid)? IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: Icon(Icons.arrow_back)):IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: Icon(Icons.arrow_back_ios)) : Container(),
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