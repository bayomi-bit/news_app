import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news/core/network/api_service.dart';

import '../model/article_mode.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  ApiService api = ApiService();
  List<Article> articles = [];

  getData() async {
    emit(NewsLoading());
    try{
      var newsResponse = await api.fetchTopHeadlines();
      articles = newsResponse.articles;
      emit(NewsSuccess(articles));
    }catch(e){
      emit(NewsError(e.toString()));
    }



  }




}
