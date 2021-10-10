import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ore_kota/firebase/googleSignInMethod.dart';

class UserInfo{
  void setInfo() async{
    await FirebaseFirestore.instance
        .collection('users') // コレクションID
        .doc(GoogleSignInMethod().currentUser!.uid) // ここは空欄だと自動でIDが付く
        .set({
      'name' : GoogleSignInMethod().currentUser!.displayName
    });
  }

  Future<DocumentSnapshot<Object?>> getData(String collection, String documentId) async {
    DocumentSnapshot docSnapshot =
    await FirebaseFirestore.instance.collection(collection).doc(documentId).get();

    return docSnapshot;
  }

  Future<String> getDatas(String collection, String documentId,String field) async {
    DocumentSnapshot docSnapshot =
    await FirebaseFirestore.instance.collection(collection).doc(documentId).get();
    Map<String, dynamic> record = docSnapshot.data as Map<String, dynamic>;
    return record[field];
  }
}
