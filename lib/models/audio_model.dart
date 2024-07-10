import 'package:cloud_firestore/cloud_firestore.dart';

class AudioModel {
  String title;
  int length;
  String link;
  String preview;
  String category;
  String id;
  AudioModel({required this.id, required this.title, required this.length, required this.link, required this.preview, required this.category});
  factory AudioModel.fromJson(DocumentSnapshot doc) {
    String id = doc.id;
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return AudioModel(id: id, title: data['title'], length: data['length'] ?? 0, link: data['link'] ?? "", preview: data['preview'] ?? "", category: data['category'] ?? "");
  }
  static List<AudioModel> fromList(List docs) {
    return docs.map((doc) => AudioModel.fromJson(doc)).toList();
  }
}
