import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news/core/router/router_const.dart';

import '../../logic_app/theme_cubit.dart';
import '../logic/news_cubit.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
        actions: [
          IconButton(onPressed: (){
            context.read<ThemeCubit>().toggleTheme();

          }, icon: const Icon(Icons.sunny))
        ],
      ),

      body: BlocBuilder<NewsCubit, NewsState>(builder: (context, state) {
        if (state is NewsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NewsSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.articles.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.go(RouterConst.details, extra: state.articles[index]);
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      Image.network(state.articles[index].urlToImage ??
                          'https://picsum.photos/250?image=9'),
                      Text(state.articles[index].title ?? ''),
                      Text(
                        state.articles[index].description ?? '',
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.grey,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ]),
                  ),
                ),
              );
            },
          );
        } else if (state is NewsError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
