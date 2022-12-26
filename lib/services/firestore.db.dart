import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:list_animation/models/perfume.model.dart';

class FirestoreDB {
  // Initialize Firebase Cloud Firestore
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<Perfume>> getAllProducts() {
    return _firebaseFirestore
        .collection('products')
        .orderBy('title', descending: false)
        // .where('category', isEqualTo: 'Gucci')
        .snapshots()
        .map((snapshot) {
      // print(snapshot.docs[11]['title']);
      return snapshot.docs.map((doc) => Perfume.fromSnapshot(doc)).toList();
    });
  }
}
