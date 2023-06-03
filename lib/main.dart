
import 'package:flutter/material.dart';
import 'package:news_api/screen/provider/NewsProvider.dart';
import 'package:news_api/screen/view/homeScreen.dart';
import 'package:news_api/screen/view/newsview.dart';
import 'package:news_api/screen/view/viewScreen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
void main()
{
  runApp(
    Sizer(builder: (context, orientation, deviceType) =>  MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => NewsProvider(),),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // initialRoute: 'view',
          routes: {
            '/':(context)=> HomeScreen(),
            'view':(context)=> viewScreen(),
            'newsview':(context)=> NewViewScreen(),
          },
        ),
      ),
    )
  );
}