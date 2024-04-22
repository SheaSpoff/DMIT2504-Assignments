import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> fetchDestinations() async {
    List<Map<String, dynamic>> destinations = [];
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('destinations').get();
      querySnapshot.docs.forEach((doc) {
        var data = doc.data();
        if (data != null) {
          destinations.add(data as Map<String, dynamic>);
        }
      });
    } catch (e) {
      print('Error fetching destinations: $e');
    }
    return destinations;
  }
}
