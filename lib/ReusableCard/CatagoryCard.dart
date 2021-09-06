import 'package:flutter/material.dart';

class catagoryCard extends StatelessWidget {
  const catagoryCard({this.icon, this.onPresseed, this.text});
  final IconData icon;
  final Function onPresseed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 90),
        height: 400,
        child: Card(
          elevation: 15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  icon,
                  color: Colors.blueAccent,
                  size: 60,
                ),
                onPressed: onPresseed,
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 30, color: Colors.blueAccent),
              )
            ],
          ),
        ),
      ),
    );
  }
}
