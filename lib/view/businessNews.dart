import 'package:flutter/material.dart';
import 'package:newsapp_luminar/controller/newsController.dart';
import 'package:newsapp_luminar/utils/myTexts.dart';
import 'package:newsapp_luminar/view/widget/newsListTile.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

class BusinessNews extends StatelessWidget {

  void fetchData(BuildContext context){
    Provider.of<NewsController>(context,listen: false)
        .fetchData();
  }

  @override
  Widget build(BuildContext context) {

    fetchData(context);

    return Scaffold(
            appBar: AppBar(
                 title: Text("Business",),
                 titleTextStyle: MyTexts.tilte,
            ),
          body: Consumer<NewsController>(
        builder: (context,provider,child){
          return provider.isLoading == true
              ? Center(
              child: Text("Loading")
              //LottieBuilder.asset("assets/animations/loading.json",
              //   fit: BoxFit.cover,
              //   height: 150,
              //   width: 150,
         // )
          )
              : ListView.separated(
                  itemBuilder: (context,index) => NewsListTile(
                    title: provider.newsModel.articles?[index].title.toString()??"",
                    description: provider.newsModel.articles?[index].description,
                    date: provider.newsModel.articles?[index].publishedAt,
                    imageUrl: provider.newsModel.articles?[index].urlToImage,
                    content: provider.newsModel.articles?[index].content,
                    sourceName: provider.newsModel.articles?[index].source?.name,
                    url: provider.newsModel.articles?[index].url,
                    author: provider.newsModel.articles?[index].author,
                  ),
                  separatorBuilder: (context,index) => Divider(height: 20,),
                  itemCount:
                  provider.newsModel.articles?.length??0
              );
        }
          )

    );
  }
}
