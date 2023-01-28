import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/screens/home_news/cubit/home_cubit.dart';

import '../../shared/widget/widgets.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('NewsApp'),
          ),
          body: Column(
            children: [
             Container(

                padding: const EdgeInsets.all(20.0),
                child: TextFormField(

                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                      filled: true,
                      labelText: 'Search',
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      )
                  ),
                  onChanged: (String val) {
                    HomeCubit.get(context).getDatasearch(val);
                  },
                ),
              ),
              Expanded(
                child: Widgets.artcel(HomeCubit
                    .get(context)
                    .search, context),
              ),
            ],
          ),
        );
      },
    );
  }
}
