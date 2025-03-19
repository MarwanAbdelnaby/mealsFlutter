import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String mealType;
  final bool isFavorite;
  final VoidCallback onFavorite;

  const RecipeCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.mealType,
    required this.isFavorite,
    required this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.network(
          imageUrl,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.image_not_supported),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(mealType),
        trailing: IconButton(
          icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.red),
          onPressed: onFavorite,
        ),
      ),
    );
  }
}
