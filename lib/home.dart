import 'package:flutter/material.dart';
import 'messages.dart';
import 'more.dart';
import 'news.dart';
import 'profile.dart';

class Home extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }

}

class HomeState extends State<Home>{

  int selectedIndex = 0;
  List<Widget> listWidgets = [News(),Profile(),Messages(),More()];
  List<IconData> listIcons = [Icons.rss_feed,Icons.supervised_user_circle,Icons.message,Icons.more];
  List<String> listTitles = ['News','Profile','Messages','More'];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(listTitles[selectedIndex],style: TextStyle()),
      ),
      body: listWidgets[selectedIndex],
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(backgroundColor: Colors.amber),
              accountName: Text('CodingWithDhrumil'),
              accountEmail: Text('abc@gmail.com'),
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: EdgeInsets.only(top:0),
              itemCount: listWidgets.length,
              itemBuilder: (context,position){
                return(
                 ListTile(leading: Icon(listIcons[position]), title: Text(listTitles[position]),onTap:(){
                   setState((){
                      selectedIndex = position;
                   });
                   Navigator.of(context).pop();
                 },)
                );
              },
            )
          ],
        ),
      ),
    );
  }

}