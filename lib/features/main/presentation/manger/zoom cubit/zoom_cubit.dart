import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobchat/features/bookmarks/presentation/view/bookmarks_view.dart';
import 'package:jobchat/features/chat/presentation/view/chat_view.dart';
import 'package:jobchat/features/login/presentation/view/login_view.dart';
import 'package:jobchat/features/main/presentation/manger/zoom%20cubit/zoom_state.dart';
import 'package:jobchat/features/profile/presentation/view/profile.dart';

import '../../../../Home/presentation/view/home_view.dart';
import '../../../../application/presentation/view/application_view.dart';


class ZoomCubit extends Cubit<ZoomState>{
  ZoomCubit():super(ZoomInitial());
  static ZoomCubit get(context) => BlocProvider.of(context);

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int newIndex){
    _currentIndex = newIndex;
    emit(ZoomSuccess());
  }


  int index1=0;

  void changeIndex(index){


      index1=index;
      emit(ChangeIndexSuccussStates());


  }



  Widget currentScreen(index) {

    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const ChatView();
      case 2:
        return const BookmarksView();
      case 3:
        return const ApplicationView();
      case 4:
        return const ProfileView();
      default:
        return const HomeView();
    }
  }




}