import 'package:flutter/material.dart';
import 'package:news_api/screen/view/viewScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

     body: Padding(
       padding: const EdgeInsets.all(8.0),
       child: CustomScrollView(
         slivers: [
           SliverAppBar(
             leading: Text("News"),
             actions: [
               Icon(Icons.notification_add_outlined)
             ],
             expandedHeight: 100,
             flexibleSpace: Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextField(
                 decoration: InputDecoration(
                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),),
                   prefixIcon: Icon(Icons.search),
                   iconColor: Colors.blue,
                   enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.amber)
                   ),

                 ),
               ),
             ),

           )
         ],
       ),
     ),
    ),);
  }
}
