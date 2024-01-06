import 'dart:convert';
import 'package:jobchat/features/login/data/model/login.dart';
import '../../../../core/Network/local/shard_preference.dart';
import '../../../../core/utils/config.dart';
import '../model/model-response.dart';
import 'login_repo.dart';
import 'package:http/http.dart' as https;

class LoginRepoImpl implements LoginRepo{

  static var client =https.Client();

  @override
  Future<bool> loginUser(LoginModel model) async{
    Map <String,String> requestHeaders ={'Content-Type':'application/json'};

    var url =Uri.https(Config.apiUrl,Config.loginUrl);
    var response=await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model),
    );
    if(response.statusCode==200){
      String token = LoginResponseModel.fromJson(response.body as Map<String, dynamic>).token;
      String userId = LoginResponseModel.fromJson(response.body as Map<String, dynamic>).user.id;
      String profile = LoginResponseModel.fromJson(response.body as Map<String, dynamic>).user.profile;
      await CacheHelper.saveData(key: "Token", value: token);
      await CacheHelper.saveData(key: "userId", value: userId);
      await CacheHelper.saveData(key: "profile", value: profile);
      await CacheHelper.saveBoolean(key: "loggedIn", value: true);
      return true;
    }else{
      return false;
    }
  }





}


