import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp_luminar/model/newsModel.dart';
import 'package:share_plus/share_plus.dart';

class NewsController with ChangeNotifier{

  NewsModel newsModel = NewsModel();
  bool isLoading = false;

  fetchData() async {

    isLoading = true;

    final url = Uri.parse("https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=83b5c137148e4d94b410436abde710e7");
    final response = await http.get(url);
    print(response.statusCode);
    Map<String, dynamic> decodedData = {};

    if(response.statusCode == 200){
      decodedData = jsonDecode(response.body);
    }else{
      print("Api failed, Error: ${response.statusCode}");
    }
    newsModel = NewsModel.fromJson(decodedData);
    isLoading = false;
    notifyListeners();
  }

  Future<void> launchURL(String url) async {
    final Uri url1 = Uri.parse(url);
    try {
      if (!await launchUrl(url1,mode: LaunchMode.inAppWebView)){
        await launchUrl(url1,mode: LaunchMode.inAppWebView);
      }else {
        throw "Could not launch $url";
      }
    } catch (e){
      print('Error launching URL: $e');
    }
    notifyListeners();
  }


  void shareText({String textToShare = ""}){
    try {
      Share.share(textToShare);
    } catch (e) {
      print("Error sharing: $e");
    }
    notifyListeners();
  }



}