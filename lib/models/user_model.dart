import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String uid;
  String name;
  String language;
  UserModel({required this.uid, required this.name, required this.language});
  factory UserModel.fromJson(DocumentSnapshot doc) {
    String id = doc.id;
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return UserModel(uid: id, language: data['language'] ?? "", name: data['name'] ?? "");
  }
  static List<UserModel> fromList(List docs) {
    return docs.map((doc) => UserModel.fromJson(doc)).toList();
  }
}
