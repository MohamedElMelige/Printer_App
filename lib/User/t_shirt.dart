import 'package:chatit/auth/ReuseableAppBar.dart';
import 'package:flutter/material.dart';

class t_shirt extends StatefulWidget {
  @override
  _t_shirtState createState() => _t_shirtState();
}

class _t_shirtState extends State<t_shirt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('T-shirt'),
      body: ListView(
        children: [
          Container(
            width: 90,
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 60,vertical: 10),
              child: Icon(Icons.image,size: 80,color: Colors.blue),
            ),
          ),
          Row(
            mainAxisAlignment:MainAxisAlignment.center ,
            children: [
              Text('Add Files',style: TextStyle(fontSize: 25),),
              SizedBox(width: 10,),
              Icon(Icons.add_circle,color: Colors.blue,)
            ],
          ),
          SizedBox(height: 30,),
          Row(
            children: [
              Icon(Icons.image,size: 30,),
              Text('file name',style: TextStyle(fontSize: 30),),
              Icon(Icons.auto_delete,size: 30,),
            ],
          ),
          SizedBox(height: 30,),
          Padding(
            padding: EdgeInsets.all(9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Number of copies:',style: TextStyle(fontSize: 25),),
                SizedBox(height: 8,),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Enter Number of copies',
                      border:OutlineInputBorder()
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: EdgeInsets.all(9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Your Address:',style: TextStyle(fontSize: 25),),
                SizedBox(height: 8,),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Enter your address',
                      border:OutlineInputBorder()
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 150,vertical: 25),
            child: FlatButton(
              onPressed:(){},
              child: Text(
                'Send',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              color: Colors.blueAccent,
              padding: EdgeInsets.all(25),
            ),
          ),
        ],
      ),

    );
  }
}