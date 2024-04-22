import 'package:flutter/material.dart';
import 'package:final_project/api/amadeus_api.dart';
import 'package:final_project/firebase/firebase_service.dart';
import 'package:final_project/firebase/favorites_service.dart';
import 'package:final_project/screens/destination_detail_screen.dart';
import 'package:final_project/widgets/destination_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseService _firebaseService = FirebaseService();
  final FavoritesService _favoritesService = FavoritesService();
  List<String> _destinations = []; 

  @override
  void initState() {
    super.initState();
    _fetchDestinations();
  }

  void _fetchDestinations() async {
    try {
      List<String> destinations = await AmadeusApi.fetchDestinations(); 
      setState(() {
        _destinations = destinations;
      });
    } catch (e) {
      print('Error fetching destinations: $e');
    }
  }

  void _handleSwipe(bool isRightSwipe) {
    if (isRightSwipe) {
      _addToFavorites(_destinations[0]);
    }
    setState(() {
      _destinations.removeAt(0);
    });
  }

  void _addToFavorites(String destination) async {
    String description = await AmadeusApi.fetchDestinationDetail(destination);
    await _favoritesService.addToFavorites(destination, description);
  }

  void _removeDestination() {
    setState(() {
      _destinations.removeAt(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Destination Match'),
      ),
      body: _destinations.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                SizedBox(height: 20.0),
                DestinationCard(
                  destination: _destinations[0], 
                  onSwipe: _handleSwipe,
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _addToFavorites(_destinations[0]);
                      },
                      child: Text('Add to Favorites'),
                    ),
                    SizedBox(width: 20.0),
                    ElevatedButton(
                      onPressed: _removeDestination,
                      child: Text('Remove'),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DestinationDetailScreen(destinationName: _destinations[0]), 
                      ),
                    );
                  },
                  child: Text('View Details'),
                ),
              ],
            ),
    );
  }
}
