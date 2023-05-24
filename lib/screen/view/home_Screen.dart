import 'package:flutter/material.dart';
import 'package:news_api/screen/modal/newsModal.dart';
import 'package:news_api/screen/provider/NewsProvider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewsProvider? providerF;
  NewsProvider? providerT;

  int? index;
  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<NewsProvider>(context, listen: false);
    providerT = Provider.of<NewsProvider>(context, listen: true);
    return SafeArea(child: Scaffold(
      body: FutureBuilder(builder: (context, snapshot) {
        if(snapshot.hasData){
          NewsModal? newsModal = snapshot.data;
          return ListTile(
            title: Text("${newsModal!.articles![0].author}"),
          );
        }
        else if(snapshot.hasError)
          {
            return Text("${snapshot.error}");
          }
        return CircularProgressIndicator();
      },future: providerF!.loadnews(),)
    ),);
  }
}
