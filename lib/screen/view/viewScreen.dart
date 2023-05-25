import 'package:flutter/material.dart';
import 'package:news_api/screen/modal/newsModal.dart';
import 'package:news_api/screen/provider/NewsProvider.dart';
import 'package:provider/provider.dart';

class viewScreen extends StatefulWidget {
  const viewScreen({Key? key}) : super(key: key);

  @override
  State<viewScreen> createState() => _viewScreenState();
}

class _viewScreenState extends State<viewScreen> {
  NewsProvider? providerF;
  NewsProvider? providerT;


  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<NewsProvider>(context, listen: false);
    providerT = Provider.of<NewsProvider>(context, listen: true);
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        actions: [
          TextButton(onPressed: () {
            providerT!.changecountry('in');
          }, child: Text("in")),
          TextButton(onPressed:() {

          }, child: Text("uk")),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(builder: (context, snapshot) {
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
            },future: providerF!.loadnews(country: providerT!.country),),
          ),
        ],
      )
    ),);
  }
}
