import 'package:flutter/material.dart';
import '../services/db_service.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final DbService _dbService = DbService();
  List<Map<String, dynamic>> _favorites = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  void _loadFavorites() async {
    final favorites = await _dbService.getFavorites();
    setState(() {
      _favorites = favorites;
    });
  }

  void _removeFavorite(int id) async {
    await _dbService.deleteFavorite(id);
    _loadFavorites();
  }

  String _timeElapsed(int timestamp) {
    final DateTime addedTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    final Duration difference = DateTime.now().difference(addedTime);

    if (difference.inSeconds < 60) {
      return "قبل ${difference.inSeconds} ثانية";
    } else if (difference.inMinutes < 60) {
      return "قبل ${difference.inMinutes} دقيقة";
    } else if (difference.inHours < 24) {
      return "قبل ${difference.inHours} ساعة";
    } else {
      return "قبل ${difference.inDays} يوم";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المفضلة')),
      body: _favorites.isEmpty
          ? const Center(child: Text('لا توجد عناصر في المفضلة'))
          : ListView.builder(
              itemCount: _favorites.length,
              itemBuilder: (context, index) {
                final item = _favorites[index];
                return ListTile(
                  leading: Image.network(item['image'], width: 50, height: 50, fit: BoxFit.cover),
                  title: Text(item['name']),
                  subtitle: Text(_timeElapsed(item['timestamp'])),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _removeFavorite(item['id']),
                  ),
                );
              },
            ),
    );
  }
}
