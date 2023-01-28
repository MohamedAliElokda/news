
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/screens/web_view/web_view.dart';

import '../../screens/home_news/cubit/home_cubit.dart';
class Widgets{

 static Widget Artcel(map,context){
    return
      Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                height: 150,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage("${map['urlToImage']}"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Container(
                height: 120,
                width: 120,
                child: Column(

                  children: [  Expanded(child: Text(
                     " ${map['title']}",maxLines: 3,overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.bodyText1),),
                    Text(
                      "${map['publishedAt']}",style: Theme.of(context).textTheme.bodyText2)],),
              )
            ],
          ),

      );
  }
 static Widget artcel(list,context){
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
              onTap: (){

                print(list[index]['url']);
                Navigator.of(context).push(MaterialPageRoute(builder: (builder){
                  return WebScreen(url: list[index]['url']);
                }));

              },
              child: Widgets.Artcel(list[index],context));
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
            child: Divider(color: Colors.black,),
          );
        },
        itemCount: list.length);
  }
}