import 'package:flutter/material.dart';

Widget myAppBar(String text)=> AppBar(
  centerTitle: true,
  backgroundColor: Colors.blueAccent,
  title: Text(
    text,
    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
  ),
);