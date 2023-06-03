import 'package:flutter/material.dart';
import 'package:news_api/screen/modal/newsModal.dart';
import 'package:provider/provider.dart';

import '../provider/NewsProvider.dart';

class NewViewScreen extends StatefulWidget {
  const NewViewScreen({Key? key}) : super(key: key);

  @override
  State<NewViewScreen> createState() => _NewViewScreenState();
}

class _NewViewScreenState extends State<NewViewScreen> {
  NewsProvider? providerF;
  NewsProvider? providerT;

  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<NewsProvider>(context, listen: false);
    providerT = Provider.of<NewsProvider>(context, listen: true);
    // int index= ModalRoute.of(context)!.settings.arguments as int;
    int op = ModalRoute.of(context)!.settings.arguments as int;

    NewsModal newsModal=NewsModal();
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          Text("${newsModal!.articles!}")
        ],

      ),
    ),);
  }
}
