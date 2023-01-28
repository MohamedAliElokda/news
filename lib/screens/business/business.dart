import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/screens/home_news/cubit/home_cubit.dart';

import '../../shared/widget/widgets.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        List list = HomeCubit.get(context).business;
        return state is GetDataBusinessLoading ? const Center(child: CircularProgressIndicator(),) : Widgets.artcel(list,context);
      },
    );
  }
}
