import 'package:flutter/material.dart';
import 'package:final_project/firebase/favorites_service.dart';
import 'package:final_project/screens/destination_detail_screen.dart'; 

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final FavoritesService _favoritesService = FavoritesService();
  late List<Map<String, dynamic>> _favoriteDestinations;

  @override
  void initState() {
    super.initState();
    _fetchFavorites();
  }

  Future<void> _fetchFavorites() async {
    List<Map<String, dynamic>> favorites = await _favoritesService.getFavorites();
    setState(() {
      _favoriteDestinations = favorites;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Destinations'),
      ),
      body: _favoriteDestinations != null
          ? ListView.builder(
              itemCount: _favoriteDestinations.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_favoriteDestinations[index]['name']),
                  subtitle: Text(_favoriteDestinations[index]['description']),
                  onTap: () {
                    _navigateToDestinationDetailScreen(_favoriteDestinations[index]);
                  },
                );
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }

  void _navigateToDestinationDetailScreen(Map<String, dynamic> destination) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DestinationDetailScreen(destinationName: destination['name']),
      ),
    );
  }
}

