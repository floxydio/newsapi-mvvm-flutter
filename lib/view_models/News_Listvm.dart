import 'package:learnbloc/models/ArticleModel.dart';

class NewsArticleViewModel {
  Article _article;

  NewsArticleViewModel({Article article}) : _article = article;

  String get title {
    return _article.title;
  }

  String get description {
    return _article.description;
  }
}
