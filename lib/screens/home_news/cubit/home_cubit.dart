import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:news/remote/dio_helper.dart';
import 'package:news/screens/settings/settings.dart';
import '../../../shared/Strings.dart';
import '../../business/business.dart';
import '../../sciences/sciences.dart';
import '../../sports/sports.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get (context)=> BlocProvider.of(context);
  int currentIndex =0;
  List<Widget> screens = [
   const BusinessScreen(),
    const SciencesScreen(),
    const SportsScreen(),


  ] ;
  List<BottomNavigationBarItem> bottomItem = [
    const BottomNavigationBarItem(icon: Icon(Icons.business),label: 'Business'),
    const BottomNavigationBarItem(icon: Icon(Icons.science),label: 'science'),
    const BottomNavigationBarItem(icon: Icon(Icons.sports),label: 'sports'),


  ] ;
  void changeIndexNavBar(int index){
    currentIndex = index ;
    emit(ChangeNavBar());
  }

  List<dynamic> business=[]  ;
  void getDataBusiness(){
    emit(GetDataBusinessLoading());

    DioHelper.getData(url:Strings.URL_API , query: {
      Strings.COUNTRY:Strings.COUNTRY_EG ,
      Strings.CATEGORY: Strings.CATEGORY_BUSINESS ,
      Strings.APIKEY: Strings.APIKEY_LINK ,
    },).then((value) {

       business = value.data["articles"];
       print(business.length);
       emit(GetDataBusinessSuccess());
    }).catchError((onError){

      print(onError);


      emit(GetDataBusinessFilder());
    });
  }


  List<dynamic> sports=[]  ;
  void getDatasports(){
    emit(GetDataSportsLoading());
    DioHelper.getData(url: Strings.URL_API , query: {
      Strings.COUNTRY:Strings.COUNTRY_EG ,
      Strings.CATEGORY: Strings.CATEGORY_SPORTS ,
      Strings.APIKEY: Strings.APIKEY_LINK ,
    },).then((value) {
      sports = value.data["articles"];
      print(business.length);
      emit(GetDataSportsSuccess());
    }).catchError((onError){
      print(onError);
      emit(GetDataSportsFilder());
    });
  }



  List<dynamic> sciences=[]  ;
  void getDatasciences(){
    emit(GetDataSciencesLoading());
    DioHelper.getData(url:Strings.URL_API , query: {
      Strings.COUNTRY:Strings.COUNTRY_EG ,
      Strings.CATEGORY: Strings.CATEGORY_SCIENES,
      Strings.APIKEY: Strings.APIKEY_LINK ,
    },).then((value) {
      sciences = value.data["articles"];
      print(business.length);
      emit(GetDataSciencesSuccess());
    }).catchError((onError){
      print(onError);
      emit(GetDataSciencesFilder());
    });
  }

  List<dynamic> search=[]  ;
  void getDatasearch(String val){

    emit(GetDataSciencesLoading());
    DioHelper.getData(url:'v2/everything' , query: {
      'q': val,
      Strings.APIKEY: Strings.APIKEY_LINK ,
    },).then((value) {
      search = value.data["articles"];
      print(business.length);
      emit(GetDataSciencesSuccess());
    }).catchError((onError){
      print(onError);
      emit(GetDataSciencesFilder());
    });
  }


//Coding SPort
}
