import 'package:flutter/material.dart';
import 'package:learnbloc/view_models/News_Listvm.dart';
import '../models/NewsModel.dart';
import '../Service/Api_Service.dart';
import '../models/ArticleModel.dart';

enum LoadingStatus { completed, searching, empty }

class NewsArticleListViewModel extends ChangeNotifier {
  var loadingStatus = LoadingStatus.searching;
  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();

  Future<void> populateTopHeadlines() async {
    _loadingStatusInitialStage();
    List<Article> newsArticles = await ApiService().fetchtopHeadlines();
    print("Data Pada ${newsArticles}");
    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))     
        .toList();
    _loadingStatusUpdate();
    notifyListeners();
  }

  void _loadingStatusInitialStage() {
    this.loadingStatus = LoadingStatus.searching;
  }

  void _loadingStatusUpdate() {
    this.loadingStatus =
        this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
  }
}
