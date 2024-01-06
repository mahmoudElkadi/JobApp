import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:jobchat/features/chat/data/model/message/received_message.dart';
import 'package:jobchat/features/chat/data/model/message/send_msg_model.dart';
import '../../../../../core/Network/local/shard_preference.dart';
import '../../../../../core/utils/config.dart';
import 'message_repo.dart';

class MessageRepoImpl implements MessageRepo{
  @override
  Future<List<dynamic>> sendMessage(SendMessageModel model)async {
    String token= await CacheHelper.getData(key: "token");
    Map <String,String> requestHeaders =
    {
      'Content-Type':'application/json',
      "token":'Bearer $token'
    };
    var url = Uri(scheme:'http', host: Config.localHost, port: 3000, path: Config.messageUrl);
    http.Response response=await http.post(
        url,
        headers: requestHeaders,
        body:jsonEncode(model.toJson())

    );
    if(response.statusCode==200){
      ReceivedMessageModel message =ReceivedMessageModel.fromJson(jsonDecode(response.body));
     Map<String,dynamic> responseMap=jsonDecode(response.body);
      return [true,message,responseMap];
    }
    else{
      return [false];
    }
  }

  @override
  Future<List<ReceivedMessageModel>> getMessages(String chatId, int offset)async {
    String token= await CacheHelper.getData(key: "token");
    Map <String,String> requestHeaders =
    {
      'Content-Type':'application/json',
      "token":'Bearer $token'
    };
    var url = Uri(scheme:'http', host: Config.localHost, port: 3000, path: "${Config.chatUrl}/$chatId");
    http.Response response=await http.get(
        url,
        headers: requestHeaders,

    );
    if(response.statusCode==200){
      var messages =receivedMessageModelFromJson(response.body);
      return messages;
    }
    else{
      throw Exception("couldn't load message");
    }
  }

}