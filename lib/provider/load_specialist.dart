import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sohna_salon_app/models/specialist_class.dart';

final specialistProvider = StreamProvider<List<SpecialistClass>>((ref) {
  try {
    return FirebaseFirestore.instance
        .collection('Specialists')
        .orderBy('createAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              return SpecialistClass(
                specialistImage: doc['imageUrl'],
                specialistTitle: doc['title'],
                id: doc.id,
              );
            }).toList());
  } catch (error) {
    // Handle error
    throw Error();
  }
});
