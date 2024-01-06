import 'dart:convert';

import 'package:jobchat/features/chat/data/model/chat/chat_model.dart';
import 'package:jobchat/features/chat/data/model/chat/create_chat_model.dart';
import 'package:jobchat/features/chat/data/model/chat/initial_chat_model.dart';
import 'package:jobchat/features/chat/data/repo/chat_repo.dart';
import 'package:http/http.dart'as http;

import '../../../../core/Network/local/shard_preference.dart';
import '../../../../core/utils/config.dart';

class ChatRepoImpl implements ChatRepo{
  @override
  Future<List<dynamic>> apply(CreateChatModel model)async {
    String token= await CacheHelper.getData(key: "token");
    Map <String,String> requestHeaders =
    {
      'Content-Type':'application/json',
      "token":'Bearer $token'
    };
    var url = Uri(scheme:'http', host: Config.localHost, port: 3000, path: Config.chatUrl);
    http.Response response=await http.post(
        url,
        headers: requestHeaders,
        body:jsonEncode(model.toJson())
    );
    if(response.statusCode==200){
      var first =initialChatModelFromJson(response.body).id;
      return [true,first];
    }
    else{
      return [false];
    }
  }

  @override
  Future<List<ChatModel>> getConversation()async {
    String token= await CacheHelper.getData(key: "token");
    Map <String,String> requestHeaders =
    {
      'Content-Type':'application/json',
      "token":'Bearer $token'
    };
    var url = Uri(scheme:'http', host: Config.localHost, port: 3000, path: Config.chatUrl);
    http.Response response=await http.post(
        url,
        headers: requestHeaders,

    );
    if(response.statusCode==200){
      var chats =chatModelFromJson(response.body);
      return chats;
    }
    else{
      throw Exception("couldn't load");
    }
  }

}