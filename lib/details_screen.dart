import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final Map<String, String> recipe;
  final Function(Map<String, String>) toggleFavorite;
  final bool isFavorite;

  const DetailsScreen({
    super.key,
    required this.recipe,
    required this.toggleFavorite,
    required this.isFavorite,
  });

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
    widget.toggleFavorite(widget.recipe);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.recipe['Title'] ?? 'Recipe Details')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ingredients:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ...widget.recipe['Ingredients']!
                .split(',')
                .map((ingredient) => Text('- ${ingredient.trim()}')),
            SizedBox(height: 20),
            Text(
              'Instructions:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              widget.recipe['Instruction'] ?? 'No instructions available',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: toggleFavorite,
              icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
              label: Text(isFavorite ? "Unmark Favorite" : "Mark as Favorite"),
            ),
          ],
        ),
      ),
    );
  }
}
