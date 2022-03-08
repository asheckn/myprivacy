import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myprivacy/views/users/view_user.dart';
import 'package:myprivacy/widgets/app_bar.dart';

import '../../models/user.dart';
import '../../services/services.dart';

class Subscribers extends StatefulWidget {
  const Subscribers({Key? key}) : super(key: key);

  @override
  _SubscribersState createState() => _SubscribersState();
}

class _SubscribersState extends State<Subscribers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Subscribers", false),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              width: MediaQuery.of(context).size.width,
              child: Text("Top Readers", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 28 ), textAlign: TextAlign.left,)),
          FutureBuilder(
            future: getUsers(),
              builder: (context, AsyncSnapshot snapshot){
                if(snapshot.data != null){
                  List<User> users = snapshot.data;
                  return ListView.builder(
                    shrinkWrap: true,
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>EditUser(user: users[index],)));
                          },
                          leading: Icon(Icons.person),
                          title: Text("${users[index].firstName} ${users[index].lastName}"),
                          subtitle: Text("${users[index].username!} BASED IN: ${users[index].location!}"),
                          trailing: IconButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>EditUser(user: users[index],)));
                          }, icon: Icon(Icons.edit)),);
                      });
                }else{
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: 5,
                          child: LinearProgressIndicator()),
                    ],
                  );
                }
              })
        ],
      ),
    );
  }
}
