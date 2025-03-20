import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sohna_salon_app/models/faq_class.dart';

final faqsProvider = StreamProvider<List<FaqClass>>((ref) {
  try {
    return FirebaseFirestore.instance
        .collection('Faqs')
        .orderBy('createAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              return FaqClass(
                  faqQuestion: doc['question'],
                  faqAnswer: doc['answer'],
                  id: doc.id);
            }).toList());
  } catch (error) {
    // Handle error gracefully
    // print('Error fetching data: $error');
    return Stream.value(
        <FaqClass>[]); // Return an empty stream in case of error
  }
});
