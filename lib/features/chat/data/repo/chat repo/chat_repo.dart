import '../model/chat/chat_model.dart';
import '../model/chat/create_chat_model.dart';

abstract class ChatRepo{
  Future<List<dynamic>> apply(CreateChatModel model);
  Future<List<ChatModel>> getConversation();
}