import '../../model/message/received_message.dart';
import '../../model/message/send_msg_model.dart';

abstract class MessageRepo{
  Future<List<dynamic>> sendMessage(SendMessageModel model);
  Future<List<ReceivedMessageModel>> getMessages(String chatId, int offset);
}