import 'dart:js';

import 'package:flutter/material.dart';
import 'package:news_api/screen/provider/NewsProvider.dart';
import 'package:news_api/screen/view/homeScreen.dart';
import 'package:news_api/screen/view/viewScreen.dart';
import 'package:provider/provider.dart';
void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NewsProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context)=> HomeScreen(),
          'view':(context)=> viewScreen(),
        },
      ),
    )
  );
}