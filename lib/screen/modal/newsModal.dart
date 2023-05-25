import 'newsModal.dart';

  class NewsModal
{
  String? status;
  int? totalResults;
  List<Articles>? articles=[];


  NewsModal({this.status, this.totalResults, this.articles});
  factory NewsModal.formJson(Map m1)
  {
    List l1= m1['articles'];
    return NewsModal(status: m1['status'],totalResults:m1['totalResults'] ,articles: l1.map((e)=>Articles.fromJson(e)).toList(),);
  }
}
class Articles
{
  String? author,title;

  Articles({this.author, this.title});
  factory Articles.fromJson(Map m1)
  {
    return Articles(title: m1['title'],author: m1['author']);
  }
}

