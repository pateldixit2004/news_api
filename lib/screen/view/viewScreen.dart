import 'package:cached_network_image/cached_network_image.dart';
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
        backgroundColor: Color(0x7bc084be),
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
                                      newsModal.articles![index].author,
                                      img:
                                      newsModal.articles![index].urlToImage,
                                      contaent:
                                      newsModal.articles![index].content,
                                      publish:
                                      "${newsModal.articles![index].publishedAt}",

                                    );

                                    Navigator.pushNamed(context, 'newsview',
                                        arguments: info);
                                  },

                                  child: Column(
                                    children: [
                                      // Padding(
                                      //   padding: const EdgeInsets.all(8.0),
                                      //   child: ClipRRect(
                                      //
                                      //     borderRadius: BorderRadius.circular(10),
                                      //     child: CachedNetworkImage(
                                      //       imageUrl: '${newsModal.articles![index].urlToImage}',
                                      //       progressIndicatorBuilder: (context, url, progress) => Center(
                                      //         child: Image.asset(
                                      //           'assets/image/img.png',
                                      //         ),
                                      //       ),
                                      //       errorWidget: (context, url, error) => Icon(Icons.account_circle),
                                      //     ),
                                      //   ),
                                      // ),

                                      tile(
                                          // img: '${newsModal.articles![index]
                                          //     .urlToImage}' == null
                                          //     ?
                                          //
                                          // 'https://www.hindustantimes.com/ht-img/img/2023/02/10/550x309/WhatsApp_Image_2021-09-18_at_09.42.18_1631944439782_1676072893301_1676072893301.jpeg'
                                          //     : '${newsModal.articles![index].urlToImage}',
                                          img: '${newsModal.articles![index]}',
                                          inf:
                                      '${newsModal.articles![index].title}',
                                          aut:
                                          '${newsModal.articles![index].author}',
                                          dat:
                                          '${newsModal.articles![index]
                                              .publishedAt}'),
                                    ],
                                  ),
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
                    return
                      Center(child: CircularProgressIndicator());

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
        height:70,
        width: double.infinity,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0x96d97f7f),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Container(

              width: 40,
              child: CircleAvatar(
                radius: 10,
                backgroundImage: NetworkImage('$img'),
                child:  CachedNetworkImage(
                  imageUrl: 'imh',
                  progressIndicatorBuilder: (context, url, progress) => Center(
                    child: Image.asset(
                      'assets/image/img.png',
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.account_circle),
                ),

              ),
            ),
            SizedBox(
              width: 1.w,
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(width: 300,child: Text("$inf",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('$aut',style: TextStyle(fontSize: 10),),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text('$dat',style: TextStyle(fontSize: 10),)
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
