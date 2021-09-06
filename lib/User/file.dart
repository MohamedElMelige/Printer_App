import 'package:chatit/auth/ReuseableAppBar.dart';
import 'package:flutter/material.dart';


class File extends StatefulWidget {
  @override
  _FileState createState() => _FileState();
}

class _FileState extends State<File> {
  String printsize='A4';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('Files'),
      body: ListView(
        children: [
          Container(
            width: 90,
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 60,vertical: 10),
              child: Icon(Icons.file_copy,size: 80,color: Colors.blue),
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
          SizedBox(height: 15,),
          Row(
            children: [
              Icon(Icons.image,size: 30,),
              Text('file name',style: TextStyle(fontSize: 30),),
              Icon(Icons.auto_delete,size: 30,),
            ],
          ),
          SizedBox(height: 15,),
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
          Padding
            (padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Print size :',style: TextStyle(fontSize: 25),),
                DropdownButton<String>(
                  isExpanded: true,
                  hint: Text('Choose'),
                  items: <String>['A4', 'A3',].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: printsize,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (String newValue) {
                  printsize=newValue;
                  },
                )
              ],
            ),
          ),
          Padding
            (padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Print Type :',style: TextStyle(fontSize: 25),),
                DropdownButton<String>(
                  hint: Text('Choose'),
                  isExpanded: true,
                  items: <String>['Black & white', 'Color',].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: printsize,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (String newValue) {
                    printsize=newValue;
                  },
                )
              ],
            ),
          ),
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