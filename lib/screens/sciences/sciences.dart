import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/widget/widgets.dart';
import '../home_news/cubit/home_cubit.dart';

class SciencesScreen extends StatelessWidget {
  const SciencesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        List list = HomeCubit.get(context).sciences;
        return state is GetDataSciencesLoading ? const Center(child: CircularProgressIndicator(),) : Widgets.artcel(list,context);
      },
    );;
  }
}
