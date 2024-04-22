import 'package:flutter/material.dart';
import 'package:final_project/firebase/favorites_service.dart';
import 'package:final_project/api/amadeus_api.dart'; 

class DestinationDetailScreen extends StatefulWidget {
  final String destinationName;
  final FavoritesService _favoritesService = FavoritesService();

  DestinationDetailScreen({Key? key, required this.destinationName}) : super(key: key);

  @override
  _DestinationDetailScreenState createState() => _DestinationDetailScreenState();
}

class _DestinationDetailScreenState extends State<DestinationDetailScreen> {
  String _description = 'Loading...'; 

  @override
  void initState() {
    super.initState();
    _fetchDescription();
  }

  Future<void> _fetchDescription() async {
    try {
      String description = await AmadeusApi.fetchDestinationDetail(widget.destinationName);
      setState(() {
        _description = description;
      });
    } catch (e) {
      print('Error fetching description: $e');
      setState(() {
        _description = 'Failed to fetch description';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.destinationName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Destination Details',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20.0),
            Text('Description: $_description'),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _addToFavorites(widget.destinationName);
              },
              child: Text('Add to Favorites'),
            ),
          ],
        ),
      ),
    );
  }

  void _addToFavorites(String destinationName) async {
    await widget._favoritesService.addToFavorites(destinationName, _description);
  }
}


