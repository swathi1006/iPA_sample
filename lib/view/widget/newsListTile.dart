import 'package:flutter/material.dart';
import 'package:newsapp_luminar/utils/myTexts.dart';
import 'package:newsapp_luminar/view/widget/detailed_page.dart';

class NewsListTile extends StatelessWidget {

  const NewsListTile({super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.imageUrl,
    required this.content,
    required this.sourceName,
    required this.url,
    required this.author
  });
  final String? title;
  final String? description;
  final DateTime? date;
  final String? imageUrl;
  final String? content;
  final String? sourceName;
  final String? url;
  final String? author;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailedNews(
              title: title!,
              description: description!,
              imageUrl: imageUrl!,
              date: date,
              content: content!,
              sourceName: sourceName!,
              url: url!,
            )) );
      },
      child: ListTile(
        leading: Container(
          height: 200,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage("$imageUrl"),fit: BoxFit.cover)
            ),),
        title: Text(title!,style: MyTexts.bodyText,textAlign: TextAlign.justify,),
        subtitle: Text("$author"),
      )
    );
  }
}
