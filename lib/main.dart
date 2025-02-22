import 'package:flutter/material.dart';
import 'details_screen.dart';
import 'favorites_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<String, String>> favoriteRecipes = [];

  void toggleFavorite(Map<String, String> recipe) {
    setState(() {
      final existingIndex = favoriteRecipes.indexWhere(
        (r) => r["Title"] == recipe["Title"],
      );
      if (existingIndex != -1) {
        favoriteRecipes.removeAt(existingIndex);
      } else {
        favoriteRecipes.add(recipe);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MY RECIPE BOOK",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.blueGrey.shade50,
      ),
      home: HomeScreen(
        toggleFavorite: toggleFavorite,
        favoriteRecipes: favoriteRecipes,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Function(Map<String, String>) toggleFavorite;
  final List<Map<String, String>> favoriteRecipes;

  HomeScreen({
    super.key,
    required this.toggleFavorite,
    required this.favoriteRecipes,
  });

  final List<Map<String, String>> recipes = [
    {
      "Title": "Classic Lasagna",
      "Ingredients":
          "Lasagna noodles, Ground beef, Tomato sauce, Ricotta cheese, Mozzarella cheese, Parmesan cheese, Egg, Garlic, Onion, Olive oil, Basil, Salt, Pepper",
      "Instruction": """
      1. Preheat oven to 375°F (190°C).
      2. Cook lasagna noodles as per package instructions.
      3. In a pan, heat olive oil, sauté onion and garlic, then add ground beef. Cook until browned.
      4. Add tomato sauce, basil, salt, and pepper. Simmer for 15 minutes.
      5. In a bowl, mix ricotta cheese, egg, and Parmesan cheese.
      6. In a baking dish, layer noodles, meat sauce, ricotta mixture, and mozzarella. Repeat layers.
      7. Bake for 45 minutes. Let cool for 10 minutes before serving.
      """,
    },
    {
      "Title": "Grilled Lemon Herb Chicken",
      "Ingredients":
          "Chicken breasts, Olive oil, Lemon juice, Garlic, Dried oregano, Thyme, Salt, Pepper",
      "Instruction": """
      1. In a bowl, mix olive oil, lemon juice, minced garlic, oregano, thyme, salt, and pepper.
      2. Coat chicken breasts with the marinade and refrigerate for at least 30 minutes.
      3. Preheat grill to medium-high heat.
      4. Grill chicken for 5-7 minutes per side until fully cooked.
      5. Let rest for 5 minutes before slicing.
      """,
    },
    {
      "Title": "Creamy Mushroom Risotto",
      "Ingredients":
          "Arborio rice, Chicken broth, Mushrooms, Onion, Garlic, Butter, Parmesan cheese, White wine, Olive oil, Salt, Pepper",
      "Instruction": """
      1. Heat chicken broth in a pot and keep warm.
      2. In a pan, heat olive oil and sauté onion and garlic.
      3. Add mushrooms and cook until tender.
      4. Add rice and toast for 1-2 minutes.
      5. Pour in white wine and stir until absorbed.
      6. Add warm broth, one ladle at a time, stirring constantly.
      7. Continue adding broth until rice is creamy and fully cooked.
      8. Stir in butter and Parmesan cheese. Serve warm.
      """,
    },
    {
      "Title": "Beef Stroganoff",
      "Ingredients":
          "Beef sirloin, Mushrooms, Onion, Garlic, Butter, Sour cream, Beef broth, Flour, Worcestershire sauce, Salt, Pepper, Egg noodles",
      "Instruction": """
      1. Cook egg noodles according to package instructions.
      2. In a pan, melt butter and sauté onion and garlic.
      3. Add sliced mushrooms and cook until softened.
      4. Add beef strips, season with salt and pepper, and cook until browned.
      5. Stir in flour and cook for 1 minute.
      6. Pour in beef broth and Worcestershire sauce, stir, and simmer for 10 minutes.
      7. Stir in sour cream and heat through (do not boil).
      8. Serve over egg noodles.
      """,
    },
    {
      "Title": "Garlic Butter Shrimp",
      "Ingredients":
          "Shrimp, Butter, Garlic, Lemon juice, Parsley, Red pepper flakes, Salt, Pepper",
      "Instruction": """
      1. In a pan, melt butter over medium heat.
      2. Add minced garlic and cook until fragrant.
      3. Add shrimp, season with salt, pepper, and red pepper flakes.
      4. Cook for 2-3 minutes per side until shrimp turns pink.
      5. Squeeze fresh lemon juice over the shrimp and sprinkle with chopped parsley.
      6. Serve immediately.
      """,
    },
    {
      "Title": "Vegetable Stir Fry",
      "Ingredients":
          "Broccoli, Carrots, Bell peppers, Snap peas, Onion, Garlic, Soy sauce, Ginger, Sesame oil, Cornstarch, Water",
      "Instruction": """
      1. In a bowl, mix soy sauce, ginger, and cornstarch with water.
      2. Heat sesame oil in a pan and sauté garlic and onion.
      3. Add carrots and bell peppers, stir-fry for 2 minutes.
      4. Add broccoli and snap peas, continue cooking for another 3 minutes.
      5. Pour sauce over vegetables and stir until thickened.
      6. Serve hot.
      """,
    },
    {
      "Title": "Homemade Pizza",
      "Ingredients":
          "Pizza dough, Tomato sauce, Mozzarella cheese, Pepperoni, Mushrooms, Bell peppers, Olive oil, Oregano",
      "Instruction": """
      1. Preheat oven to 450°F (230°C).
      2. Roll out pizza dough and place on a baking sheet.
      3. Spread tomato sauce evenly over the dough.
      4. Sprinkle mozzarella cheese generously.
      5. Add toppings like pepperoni, mushrooms, and bell peppers.
      6. Drizzle with olive oil and sprinkle oregano.
      7. Bake for 12-15 minutes until cheese is bubbly and crust is golden brown.
      8. Let cool for a few minutes then slice it.
      """,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Recipe Book")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => FavoritesScreen(
                          favoriteRecipes: favoriteRecipes,
                          toggleFavorite: toggleFavorite,
                        ),
                  ),
                );
              },
              child: Text("View Favorites"),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(recipes[index]["Title"]!),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => DetailsScreen(
                              recipe: recipes[index],
                              toggleFavorite: toggleFavorite,
                              isFavorite: favoriteRecipes.any(
                                (r) => r["Title"] == recipes[index]["Title"],
                              ),
                            ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
