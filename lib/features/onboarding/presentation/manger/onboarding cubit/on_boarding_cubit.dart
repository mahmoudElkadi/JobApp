import 'package:flutter_bloc/flutter_bloc.dart';
import 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState>{
  OnBoardingCubit():super(OnBoardingInitial());
  static OnBoardingCubit get(context) => BlocProvider.of(context);

  bool _isLastPage = false;

  bool get isLastPage =>_isLastPage;

  set isLastPage (bool lastPage){
    _isLastPage = lastPage;
    emit(OnBoardingSuccess());
  }


}