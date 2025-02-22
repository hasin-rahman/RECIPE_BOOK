import 'package:flutter/material.dart';
import 'details_screen.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Map<String, String>> favoriteRecipes;
  final Function(Map<String, String>) toggleFavorite;

  const FavoritesScreen({
    super.key,
    required this.favoriteRecipes,
    required this.toggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorite Recipes")),
      body:
          favoriteRecipes.isEmpty
              ? Center(child: Text("No favorite recipes yet!"))
              : ListView.builder(
                itemCount: favoriteRecipes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(favoriteRecipes[index]["Title"]!),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => DetailsScreen(
                                recipe: favoriteRecipes[index],
                                toggleFavorite: toggleFavorite,
                                isFavorite: true,
                              ),
                        ),
                      );
                    },
                  );
                },
              ),
    );
  }
}
