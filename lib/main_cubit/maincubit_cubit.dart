import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news/remote/shared_preferences.dart';

part 'maincubit_state.dart';

class MaincubitCubit extends Cubit<MaincubitState> {
  MaincubitCubit() : super(MaincubitInitial());
  static MaincubitCubit get (context) => BlocProvider.of(context);



  bool changeMode = false ;
  void ChangeMode ( {bool ? isDark}){
    if(isDark != null){
      changeMode = isDark ;
      emit(MainChangeModeInitial());
    }else{
    changeMode = !changeMode ;
    CacheHelper.putBoolean(key: 'isDark', value: changeMode).then((value) {emit(MainChangeModeInitial());});

  } }
}
