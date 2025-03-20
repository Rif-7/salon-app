import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sohna_salon_app/models/deal_class.dart';

final dealsProvider = StreamProvider<List<DealClass>>((ref) {
  try {
    final res = FirebaseFirestore.instance
        .collection('Deals')
        .orderBy('createAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              return DealClass(
                dealImage: doc['imageUrl'],
                dealTitle: doc['title'],
                dealDescription: doc['description'],
                id: doc.id,
                dealPrice: doc['price'],
              );
            }).toList());
    return res;
  } catch (error) {
    print("heloooooooooooooooooooooooooooooooooooooooooooooooo");
    // Handle error
    throw Error();
  }
});
