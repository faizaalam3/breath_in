import 'package:breathin/utils/extensions/widget_extension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Db {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;

  Future<bool> setDocument({String? docId, required String collectionPath, required Map<String, dynamic> data}) async {
    try {
      await _instance.collection(collectionPath).doc(docId).set(data);
      return true;
    } on FirebaseException catch (e) {
      e.message.toString().showMessage;
      throw Exception(e.message);
    } catch (e) {
      e.toString().showMessage;
      throw Exception(e.toString());
    }
  }

  Future<String> addDocument({required String collectionPath, required Map<String, dynamic> data}) async {
    try {
      return await _instance.collection(collectionPath).add(data).then((value) {
        return value.id;
      });
    } on FirebaseException catch (e) {
      e.message.toString().showMessage;
      throw Exception(e.message);
    } catch (e) {
      e.toString().showMessage;
      throw Exception(e.toString());
    }
  }

  Future<bool> updateDocument({required String docId, required String collectionPath, required Map<String, dynamic> data}) async {
    try {
      await _instance.collection(collectionPath).doc(docId).update(data);
      return true;
    } on FirebaseException catch (e) {
      e.message.toString().showMessage;
      throw Exception(e.message);
    } catch (e) {
      e.toString().showMessage;
      throw Exception(e.toString());
    }
  }

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

  Future<bool> docExists({required String collectionPath, required String id}) async {
    return await _instance.collection(collectionPath).doc(id).get().then((value) {
      return value.exists;
    }).onError((error, stackTrace) {
      error.toString().showMessage;
      return false;
    });
  }

  Future<bool> anyDocExists({required Query query}) async {
    return await query.get().then((value) {
      return value.docs.isNotEmpty;
    }).onError((error, stackTrace) {
      error.toString().showMessage;
      return false;
    });
  }
}
