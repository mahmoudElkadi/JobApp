import 'dart:convert';

List<ChatModel> chatModelFromJson(String str) => List<ChatModel>.from(json.decode(str).map((x) => ChatModel.fromJson(x)));

String chatModelToJson(List<ChatModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChatModel {
  final String id;
  final String chatName;
  final bool isGroupChat;
  final List<User> users;
  final DateTime createdAt;
  final DateTime updatedAt;
  final LatestMessage latestMessage;

  ChatModel({
    required this.id,
    required this.chatName,
    required this.isGroupChat,
    required this.users,
    required this.createdAt,
    required this.updatedAt,
    required this.latestMessage,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
    id: json["_id"],
    chatName: json["chatName"],
    isGroupChat: json["isGroupChat"],
    users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    latestMessage: LatestMessage.fromJson(json["latestMessage"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "chatName": chatName,
    "isGroupChat": isGroupChat,
    "users": List<dynamic>.from(users.map((x) => x.toJson())),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "latestMessage": latestMessage.toJson(),
  };
}

class LatestMessage {
  final String id;
  final String content;
  final Sender sender;
  final String receiver;
  final String chat;

  LatestMessage({
    required this.id,
    required this.content,
    required this.sender,
    required this.receiver,
    required this.chat,
  });

  factory LatestMessage.fromJson(Map<String, dynamic> json) => LatestMessage(
    id: json["_id"],
    content: json["content"],
    sender: Sender.fromJson(json["sender"]),
    receiver: json["receiver"],
    chat: json["chat"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "content": content,
    "sender": sender.toJson(),
    "receiver": receiver,
    "chat": chat,
  };
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

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userName": userName,
    "email": email,
    "profile": profile,
  };
}

class User {
  final String id;
  final String userName;
  final String email;
  final String profile;
  final String phone;
  final String location;

  User({
    required this.id,
    required this.userName,
    required this.email,
    required this.profile,
    required this.phone,
    required this.location,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    userName: json["userName"],
    email: json["email"],
    profile: json["profile"],
    phone: json["phone"],
    location: json["location"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userName": userName,
    "email": email,
    "profile": profile,
    "phone": phone,
    "location": location,
  };
}
