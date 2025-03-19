import 'package:flutter/material.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({super.key});

  @override
  _RecipesScreenState createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  List<Map<String, dynamic>> recipes = [
    {
      'name': 'Classic Margherita Pizza',
      'type': 'Dinner',
      'image': 'https://www.themealdb.com/images/media/meals/llcbn01574260722.jpg',
      'isFavorite': false,
    },
    {
      'name': 'Vegetarian Stir-Fry',
      'type': 'Lunch',
      'image': 'https://www.themealdb.com/images/media/meals/wpputp1511812960.jpg',
      'isFavorite': false,
    },
    {
      'name': 'Chocolate Chip Cookies',
      'type': 'Snack, Dessert',
      'image': 'https://www.themealdb.com/images/media/meals/xrttsx1487339558.jpg',
      'isFavorite': false,
    },
    {
      'name': 'Sushi Platter',
      'type': 'Lunch, Dinner',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/6/60/Sushi_platter.jpg',
      'isFavorite': false,
    },
    {
      'name': 'Classic Margherita Pizza',
      'type': 'Dinner',
      'image': 'https://www.themealdb.com/images/media/meals/llcbn01574260722.jpg',
      'isFavorite': false,
    },
    {
      'name': 'Vegetarian Stir-Fry',
      'type': 'Lunch',
      'image': 'https://www.themealdb.com/images/media/meals/wpputp1511812960.jpg',
      'isFavorite': false,
    },
    {
      'name': 'Chocolate Chip Cookies',
      'type': 'Snack, Dessert',
      'image': 'https://www.themealdb.com/images/media/meals/xrttsx1487339558.jpg',
      'isFavorite': false,
    },
    {
      'name': 'Sushi Platter',
      'type': 'Lunch, Dinner',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/6/60/Sushi_platter.jpg',
      'isFavorite': false,
    },{
      'name': 'Classic Margherita Pizza',
      'type': 'Dinner',
      'image': 'https://www.themealdb.com/images/media/meals/llcbn01574260722.jpg',
      'isFavorite': false,
    },
    {
      'name': 'Vegetarian Stir-Fry',
      'type': 'Lunch',
      'image': 'https://www.themealdb.com/images/media/meals/wpputp1511812960.jpg',
      'isFavorite': false,
    },
    {
      'name': 'Chocolate Chip Cookies',
      'type': 'Snack, Dessert',
      'image': 'https://www.themealdb.com/images/media/meals/xrttsx1487339558.jpg',
      'isFavorite': false,
    },
    {
      'name': 'Sushi Platter',
      'type': 'Lunch, Dinner',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/6/60/Sushi_platter.jpg',
      'isFavorite': false,
    },{
      'name': 'Classic Margherita Pizza',
      'type': 'Dinner',
      'image': 'https://www.themealdb.com/images/media/meals/llcbn01574260722.jpg',
      'isFavorite': false,
    },
    {
      'name': 'Vegetarian Stir-Fry',
      'type': 'Lunch',
      'image': 'https://www.themealdb.com/images/media/meals/wpputp1511812960.jpg',
      'isFavorite': false,
    },
    {
      'name': 'Chocolate Chip Cookies',
      'type': 'Snack, Dessert',
      'image': 'https://www.themealdb.com/images/media/meals/xrttsx1487339558.jpg',
      'isFavorite': false,
    },
    {
      'name': 'Sushi Platter',
      'type': 'Lunch, Dinner',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/6/60/Sushi_platter.jpg',
      'isFavorite': false,
    },
  ];

  void toggleFavorite(int index) {
    setState(() {
      recipes[index]['isFavorite'] = !(recipes[index]['isFavorite'] ?? false);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          recipes[index]['isFavorite']
              ? 'Added to favorite ❤️'
              : 'Removed from favorite 💔',
          style: const TextStyle(fontSize: 16),
        ),
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.black87,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الوصفات')),
      body: SingleChildScrollView(
        child: Column(
          children: recipes.map((recipe) {
            int index = recipes.indexOf(recipe);
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: ListTile(
                leading: Image.network(
                  recipe['image'] ?? '',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.broken_image, size: 50, color: Colors.grey);
                  },
                ),
                title: Text(recipe['name'] ?? 'No Name'),
                subtitle: Text('نوع الوجبة: ${recipe['type'] ?? 'Unknown'}'),
                trailing: IconButton(
                  icon: Icon(
                    (recipe['isFavorite'] ?? false) ? Icons.favorite : Icons.favorite_border,
                    color: (recipe['isFavorite'] ?? false) ? Colors.red : Colors.grey,
                  ),
                  onPressed: () => toggleFavorite(index),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
