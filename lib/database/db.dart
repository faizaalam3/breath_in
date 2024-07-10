import 'package:breathin/utils/extensions/widget_extension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Db {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;
  Future<T> getDocumentById<T>({required String collectionPath, required String documentId, required T Function(DocumentSnapshot) fromJson}) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await _instance.collection(collectionPath).doc(documentId).get();
      return fromJson(documentSnapshot);
    } on FirebaseException catch (e) {
      e.message.toString().showMessage;
      throw Exception(e.message);
    } catch (e) {
      e.toString().showMessage;
      throw Exception(e.toString());
    }
  }

  Future<T> getDocuments<T>({Query? query, String? collectionPath, required T Function(List<DocumentSnapshot>) fromList}) async {
    try {
      final QuerySnapshot<Object?> querySnapshots;
      if (query == null) {
        querySnapshots = await _instance.collection(collectionPath!).get();
      } else {
        querySnapshots = await query.get();
      }
      return fromList(querySnapshots.docs);
    } on FirebaseException catch (e) {
      e.message.toString().showMessage;
      throw Exception(e.message);
    } catch (e) {
      e.toString().showMessage;
      throw Exception(e.toString());
    }
  }
}
