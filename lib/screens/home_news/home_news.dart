import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/main_cubit/maincubit_cubit.dart';
import 'package:news/remote/dio_helper.dart';
import 'package:news/screens/home_news/cubit/home_cubit.dart';
import 'package:news/screens/screen_search/screen_search.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return Scaffold(

          appBar: AppBar(
            title: const Text('NewsApp'),
            actions:  [
              IconButton(onPressed: (){
                HomeCubit.get(context).search.clear();
                Navigator.of(context).push(MaterialPageRoute(builder: (c){
                  return  SearchScreen();
                }));
              }, icon:const Icon(Icons.search)),
              IconButton(onPressed: (){

                MaincubitCubit.get(context).ChangeMode();
              }, icon:const Icon(Icons.mode_night)),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeIndexNavBar(index);
               if(index ==1 &&  HomeCubit.get(context).sciences.isEmpty){
                HomeCubit.get(context).getDatasciences();
              }else if(index == 2  && HomeCubit.get(context).sports.isEmpty){
                HomeCubit.get(context).getDatasports();
              }else if (HomeCubit.get(context).business.isEmpty){
                 HomeCubit.get(context).getDataBusiness();
               }


            },
            items: cubit.bottomItem,
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );

  }


}
