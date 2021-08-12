import 'package:dio/dio.dart';
import 'package:learnbloc/models/ArticleModel.dart';
import 'package:learnbloc/models/UserModel.dart';
import 'package:learnbloc/models/UserSpec.dart';
import '../models/NewsModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  var apiKey = "788d81ce1b264bd590286386745d90fc";

  Future<List<Article>> fetchtopHeadlines() async {
    final response = await http.get(
        "https://newsapi.org/v2/top-headlines?country=id&apiKey=788d81ce1b264bd590286386745d90fc");
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      final articleResult = NewsModel.fromJson(result);
      return articleResult.articles;
    } else {
      throw Exception("Failed to get top news");
    }
  }

  Future<List<UserSpec>> listUser() async {
    final response = await http.get("https://randomuser.me/api/");

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      final articleResult = UserModel.fromJson(result);
      return articleResult.results;
    } else {
      throw Exception("Failed to get top news");
    }
  }
}
