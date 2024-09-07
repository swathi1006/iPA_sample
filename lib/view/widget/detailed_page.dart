import 'package:flutter/material.dart';
import 'package:newsapp_luminar/controller/newsController.dart';
import 'package:newsapp_luminar/utils/myTexts.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class DetailedNews extends StatelessWidget {

  const DetailedNews({super.key,
    required this.title,
    required this.description,
    this.date,
    required this.imageUrl,
    required this.content,
    required this.sourceName,
    required this.url
  });

  final String title;
  final String description;
  final DateTime? date;
  final String imageUrl;
  final String content;
  final String sourceName;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5,),
              Text(title,
                style: MyTexts.tilte,),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("$sourceName | ${DateFormat('dd/MM/yyyy').format(date!).toString()}"),
                  IconButton(onPressed: (){
                    String newsToShare = "$title \n \n $description \n \n $url";
                    Provider.of<NewsController>(context, listen: false).shareText(textToShare: newsToShare);
                  }, icon: const Icon(Icons.share))
                ],
              ),
              const SizedBox(height:20),
              Container(
                height: MediaQuery.sizeOf(context).height * 40 / 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(imageUrl), fit: BoxFit.cover)),
              ),
              SizedBox(height: 20,),
              Text(
                "$description",
                style:  const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20,),
              SingleChildScrollView(
                child: Text("$content",
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
              ),
              const SizedBox(height: 20,),
              InkWell(
                onTap: () {
                  Provider.of<NewsController>(context, listen: false)
                      .launchURL(url);
                },
                child: const Text("Click here to read more",
                  style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      color: Colors.blue), ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
