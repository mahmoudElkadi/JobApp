import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit():super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  final TextEditingController email=TextEditingController();
  final TextEditingController password=TextEditingController();

  @override
  Future<void> close() {
    email.dispose();
    password.dispose();
    return super.close();
  }

  bool _obscureText=true;

  bool get obscureText => _obscureText;

  set obscureText(bool newState){
    _obscureText=newState;
    emit(ObscureText());
  }


}