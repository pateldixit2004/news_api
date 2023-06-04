import 'package:flutter/material.dart';
import 'package:news_api/screen/modal/infoModel.dart';
import 'package:news_api/screen/modal/newsModal.dart';
import 'package:news_api/screen/provider/NewsProvider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class viewScreen extends StatefulWidget {
  const viewScreen({Key? key}) : super(key: key);

  @override
  State<viewScreen> createState() => _viewScreenState();
}

class _viewScreenState extends State<viewScreen> {
  NewsProvider? providerF;
  NewsProvider? providerT;
  int? index;

  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<NewsProvider>(context, listen: false);
    providerT = Provider.of<NewsProvider>(context, listen: true);
    infoModel info = infoModel();
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text('News Api', style: TextStyle(color: Colors.black),),
            centerTitle: true,
            actions: [
              TextButton(
                  onPressed: () {
                    providerT!.changecountry('in');
                  },
                  child: Text("in"),
                  style: TextButton.styleFrom(foregroundColor: Colors.black)),
              TextButton(onPressed: () {
                providerT!.changecountry('Au');
              },
                child: Text("Au"),
                style: TextButton.styleFrom(foregroundColor: Colors.black),),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      NewsModal? newsModal = snapshot.data;
                      return Column(
                        children: [
                          ListTile(
                            leading: Text(
                              'Latest news',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          // Expanded(
                          //   child: ListView.builder(itemBuilder: (context, index) {
                          //     return Padding(
                          //       padding: const EdgeInsets.all(8.0),
                          //       child: Container(
                          //         height: 10.h,
                          //         width: 50.w,
                          //         color: Colors.blue,
                          //         child: Padding(
                          //           padding: const EdgeInsets.all(8.0),
                          //           child: Column(
                          //             crossAxisAlignment: CrossAxisAlignment.start,
                          //             children: [
                          //               Text("${newsModal!.articles![index].title}",
                          //                 style: TextStyle(fontSize: 10.sp,
                          //                     color: Colors.white),),
                          //               Spacer(),
                          //               Text("${newsModal!.articles![index]
                          //                   .publishedAt}"),
                          //             ],
                          //           ),
                          //         ),
                          //       ),
                          //     );
                          //   },
                          //     itemCount: newsModal!.articles!.length,
                          //     scrollDirection: Axis.horizontal,),
                          // ),
                          Expanded(
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    infoModel info = infoModel(
                                      author:
                                      newsModal!.articles![index].author,
                                      img:
                                      newsModal!.articles![index].urlToImage,
                                      contaent:
                                      newsModal!.articles![index].content,
                                      // publish: newsModal!.articles![index].publishedAt,
                                    );

                                    Navigator.pushNamed(context, 'newsview',
                                        arguments: info);
                                  },
                                  child: tile(
                                      img: '${newsModal!.articles![index]
                                          .urlToImage}' == null
                                          ?

                                      'https://www.google.com/imgres?imgurl=https%3A%2F%2Fcdn.britannica.com%2F97%2F1597-050-008F30FA%2FFlag-India.jpg&tbnid=LDAjM51x9-NkkM&vet=12ahUKEwiA7uSJ5Kj_AhUF5HMBHTq7DU8QMygCegUIARDuAQ..i&imgrefurl=https%3A%2F%2Fwww.britannica.com%2Fplace%2FIndia&docid=qsYvT3y4ymQyVM&w=1600&h=1067&itg=1&q=india&ved=2ahUKEwiA7uSJ5Kj_AhUF5HMBHTq7DU8QMygCegUIARDuAQ'
                                          : '${newsModal!.articles![index]
                                          .urlToImage},

                                      inf:
                                  '${newsModal!.articles![index].title}',
                                      aut:
                                      '${newsModal!.articles![index].author}',
                                      dat:
                                      '${newsModal!.articles![index]
                                          .publishedAt}'),
                                );
                              },
                              itemCount: newsModal!.articles!.length,
                            ),
                          )
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  },
                  future: providerF!.loadnews(country: providerT!.country),
                ),
              ),
            ],
          )),
    );
  }

  Widget tile({String? img, String? inf, String? aut, String? dat}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 20.h,
        width: 100.w,
        color: Colors.red,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                "$img",
                height: 50,
                width: 50,
              ),
            ),
            SizedBox(
              width: 1.w,
            ),
            Column(
              children: [
                Text("$inf"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('$aut'),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text('$dat')
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
