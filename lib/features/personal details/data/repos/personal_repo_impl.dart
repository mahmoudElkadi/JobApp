import 'dart:convert';
import 'package:get/get_core/src/get_main.dart';
import 'package:jobchat/core/utils/constants.dart';
import 'package:jobchat/features/login/data/model/login.dart';
import '../../../../core/Network/local/shard_preference.dart';
import '../../../../core/utils/config.dart';
import '../model/model-response.dart';
import 'login_repo.dart';
import 'package:http/http.dart' as http;

class LoginRepoImpl implements LoginRepo{

  //static var client =https.Client();

  @override
  Future<bool> loginUser(LoginModel model) async{
    print("enter");
    Map <String,String> requestHeaders ={'Content-Type':'application/json'};

    var url = Uri(scheme:'http', host: '192.168.1.4', port: 3000, path: '/api/login');
    http.Response response=await http.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model),
    );
    if(response.statusCode==200){
      String data=response.body;
      print(data);
      String token = LoginResponseModel.fromJson(jsonDecode(response.body) ).token;
       String userId = LoginResponseModel.fromJson(jsonDecode(response.body)).user.id;
      // String profile = LoginResponseModel.fromJson(response.body as Map<String, dynamic>).user.profile;
      tokenS=await CacheHelper.saveData(key: "Token", value: token);
       await CacheHelper.saveData(key: "userId", value: userId);
      // await CacheHelper.saveData(key: "profile", value: profile);
      // await CacheHelper.saveBoolean(key: "loggedIn", value: true);
      return true;
    }else{
      return false;
    }
  }



  @override
  Future<bool> updateProfile(LoginModel model) async{
    print("enter");
    Map <String,String> requestHeaders ={'Content-Type':'application/json'};

    var url = Uri(scheme:'http', host: '192.168.1.4', port: 3000, path: '/api/login');
    http.Response response=await http.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model),
    );
    if(response.statusCode==200){
      String data=response.body;
      print(data);
      String token = LoginResponseModel.fromJson(jsonDecode(response.body) ).token;
      String userId = LoginResponseModel.fromJson(jsonDecode(response.body)).user.id;
      // String profile = LoginResponseModel.fromJson(response.body as Map<String, dynamic>).user.profile;
      tokenS=await CacheHelper.saveData(key: "Token", value: token);
      await CacheHelper.saveData(key: "userId", value: userId);
      // await CacheHelper.saveData(key: "profile", value: profile);
      // await CacheHelper.saveBoolean(key: "loggedIn", value: true);
      return true;
    }else{
      return false;
    }
  }





}


