import 'package:cloud_firestore/cloud_firestore.dart';

class FavoritesService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addToFavorites(String destinationName, String description) async {
    try {
      Map<String, dynamic> destinationData = {
        'name': destinationName,
        'description': description,
      };
      await _firestore.collection('favorites').add(destinationData);
    } catch (e) {
      print('Error adding to favorites: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getFavorites() async {
    List<Map<String, dynamic>> favorites = [];
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('favorites').get();
      favorites = querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      print('Error fetching favorites: $e');
    }
    return favorites;
  }

  Future<void> removeFromFavorites(String id) async {
    try {
      await _firestore.collection('favorites').doc(id).delete();
    } catch (e) {
      print('Error removing from favorites: $e');
    }
  }
}

