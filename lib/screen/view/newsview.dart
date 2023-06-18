import 'package:flutter/material.dart';
import 'package:news_api/screen/modal/infoModel.dart';
import 'package:news_api/screen/modal/newsModal.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

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
    infoModel info = ModalRoute.of(context)!.settings.arguments as infoModel;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 20.h,
                width: 100.w,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          '${info.img}',
                        ),
                        fit: BoxFit.fill)),
              ),
              SizedBox(height: 15,),
              info.contaent==null?Text("Contant is Not avalible"):Text(
                "${info.contaent}",
                style: TextStyle(fontSize: 15),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${info.publish}"),
                  Text("${info.author}"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
