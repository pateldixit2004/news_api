import 'package:flutter/material.dart';
import 'package:news_api/screen/modal/newsModal.dart';

import '../../utilis/api_helper.dart';

class NewsProvider extends ChangeNotifier
{
  int? index;
  Future<NewsModal> loadnews()
  async {
   return await Apihelper.apihelper.getApi();
  }

}