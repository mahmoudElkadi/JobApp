import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobchat/features/register/presentation/manger/register%20cubit/register_state.dart';


class RegisterCubit extends Cubit<RegisterState>{
  RegisterCubit():super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);

  final TextEditingController email=TextEditingController();
  final TextEditingController name=TextEditingController();
  final TextEditingController password=TextEditingController();

  @override
  Future<void> close() {
    email.dispose();
    password.dispose();
    name.dispose();
    print('DDDDiIIssssspose');
    return super.close();
  }

  bool _obscureText=true;

  bool get obscureText => _obscureText;

  set obscureText(bool newState){
    _obscureText=newState;
    emit(ObscureTextSuccess());
  }

  bool passwordValidator(String password){
    if(password.isEmpty) return false;
    String pattern=
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp=RegExp(pattern);
    return regExp.hasMatch(password);

  }


}