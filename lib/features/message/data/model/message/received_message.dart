import 'dart:convert';

List<ReceivedMessageModel> receivedMessageModelFromJson(String str) => List<ReceivedMessageModel>.from(json.decode(str).map((x) => ReceivedMessageModel.fromJson(x)));

class ReceivedMessageModel {
  final String id;
  final String content;
  final Sender sender;
  final Chat chat;
  final List<dynamic> readBy;

  ReceivedMessageModel({
    required this.id,
    required this.content,
    required this.sender,
    required this.chat,
    required this.readBy,
  });

  factory ReceivedMessageModel.fromJson(Map<String, dynamic> json) => ReceivedMessageModel(
    id: json["_id"],
    content: json["content"],
    sender: Sender.fromJson(json["sender"]),
    chat: Chat.fromJson(json["chat"]),
    readBy: List<dynamic>.from(json["readBy"].map((x) => x)),
  );


}

class Chat {
  final String id;
  final String chatName;
  final bool isGroupChat;
  final List<Sender> users;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final String latestMessage;

  Chat({
    required this.id,
    required this.chatName,
    required this.isGroupChat,
    required this.users,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.latestMessage,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
    id: json["_id"],
    chatName: json["chatName"],
    isGroupChat: json["isGroupChat"],
    users: List<Sender>.from(json["users"].map((x) => Sender.fromJson(x))),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    latestMessage: json["latestMessage"],
  );


}

class Sender {
  final String id;
  final String userName;
  final String email;
  final String profile;

  Sender({
    required this.id,
    required this.userName,
    required this.email,
    required this.profile,
  });

  factory Sender.fromJson(Map<String, dynamic> json) => Sender(
    id: json["_id"],
    userName: json["userName"],
    email: json["email"],
    profile: json["profile"],
  );


}
