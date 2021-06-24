//API key : 63ffb4788cb8a8660a342cfa53899ebe
//API read access token: eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2M2ZmYjQ3ODhjYjhhODY2MGEzNDJjZmE1Mzg5OWViZSIsInN1YiI6IjYwOGZlMmFhMzYzOTA5MDAyYWIwNGE4NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.DISVRLsnkt3U6ajy4SyyLDhZKig0bGvGuE9IxYVO8IY

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sohilbhanani_moviedb/theme.dart';

import 'homescreen.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme(),
      home: HomeScreen(),
    );
  }
}
