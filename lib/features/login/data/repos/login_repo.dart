import 'package:jobchat/features/login/data/model/login.dart';

abstract class LoginRepo
{
  Future<bool> loginUser(LoginModel model);

}

