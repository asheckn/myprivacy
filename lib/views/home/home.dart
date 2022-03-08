import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:myprivacy/constants/routes.dart';
import 'package:myprivacy/helpers.dart';
import 'package:myprivacy/widgets/app_bar.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../constants/palette.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final  String mdFileName = "popi.md";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "My Privacy"),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
         mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                width: MediaQuery.of(context).size.width,
                child: Text("GOOD ${greeting().toUpperCase()}", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 28 ), textAlign: TextAlign.left,)),
            Container(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                width: MediaQuery.of(context).size.width,
                child: Text("Top Article", style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black54), textAlign: TextAlign.left)),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 212,
                width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: saGreen.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                      image:
                      NetworkImage("https://www.michalsons.com/wp-content/uploads/2017/05/Protection-of-Personal-Information-Act-PoPIA.jpg"),fit: BoxFit.contain,),
                )


              ),
            ),
            Theme(
              
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(title: Text("What is PoPIA or POPI ?"),
              children: [FutureBuilder(
                future:   Future.delayed(Duration(milliseconds: 150)).then((value) {
                  return DefaultAssetBundle.of(context)
                      .loadString('assets/${mdFileName}');
                }),
                builder: (context, AsyncSnapshot snapshot){
                  if(snapshot.hasData){
                    return Markdown(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        data: snapshot.data);
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );

                },
              ),],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Divider(thickness: 2, color: saGreen.withOpacity(0.2),),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                width: MediaQuery.of(context).size.width,
                child: Text("Subscribers", style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black54), textAlign: TextAlign.left)),
            SizedBox(
              height: 10,
            ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: TextButton(
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: saBlue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                  )
              ),
              onPressed:  (){
                Navigator.pushNamed(context, Routes.users);
              }, child: Text("View Subscribers", style: TextStyle(color: Colors.white),)),
        ),
            SizedBox(
              height: 20,
            ),



          ]

        ),
      ),
    );
  }
}
