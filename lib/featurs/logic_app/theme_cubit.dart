import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../core/shared_preferences/shrd_pre.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  void getTheme() async{
    bool isDark = await ShrdPre.getTheme();
    if (isDark) {
      emit(ThemeIsDark());
    } else {
      emit(ThemeIsLight());
    }
  }
  void toggleTheme() async{
   if (state is ThemeIsDark) {
     emit(ThemeIsLight());
     await ShrdPre.setTheme(false);

   } else {
     emit(ThemeIsDark());
   await ShrdPre.setTheme(true);
   }

  }

}
