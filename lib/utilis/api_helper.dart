import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_api/screen/modal/newsModal.dart';
class Apihelper

{
  static Apihelper apihelper=Apihelper();
  Future<NewsModal> getApi({String? country})
  async {
    String? link='https://newsapi.org/v2/top-headlines?country=$country&category=business&apiKey=f6fbf52fdd074fa1bc643acc56a05978';
    var responce=await http.get(Uri.parse(link));
    var json=jsonDecode(responce.body);
    NewsModal newsModal =NewsModal.fromJson(json);
    return newsModal;
  }
}