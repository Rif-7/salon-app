import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sohna_salon_app/models/order_class.dart';

final orderProvider = StreamProvider<List<OrderClass>>((ref) {
  final userId = FirebaseAuth.instance.currentUser!.uid;
  try {
    print("helooo\n");
    final res = FirebaseFirestore.instance
        .collection('Orders')
        .where('userId', isEqualTo: userId) // Filter orders by userId
        // .where('total', isGreaterThan: 0)
        // .orderBy('createAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              print("Total Orders: ${snapshot.docs.length}");
              List<String> services =
                  []; // Initialize an empty list for services
              List<String> servicesPrice = [];
              if (doc['services'] != null) {
                // Check if services field is not null
                services =
                    List<String>.from(doc['services']); // Parse services array
                servicesPrice = List<String>.from(doc['servicesPrice']);
              }

              List<String> deals = []; // Initialize an empty list for services
              List<String> dealsPrice = [];
              if (doc['deals'] != null) {
                // Check if services field is not null
                deals = List<String>.from(doc['deals']); // Parse services array
                dealsPrice = List<String>.from(doc['dealsPrice']);
              }

              return OrderClass(
                  userName: doc['name'],
                  userImage: doc['photo'],
                  date: doc['date'],
                  time: doc['time'],
                  deals: deals,
                  dealsPrice: dealsPrice,
                  services: services,
                  servicePrice: servicesPrice,
                  total: doc['total'],
                  id: doc.id);
            }).toList());
    return res;
  } catch (error) {
    // Handle error
    print("error");
    throw Error();
  }
});
