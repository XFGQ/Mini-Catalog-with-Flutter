import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/user_data.dart';
import 'detail_screen.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    List<Data> myFavorites = [];
    if (currentUser != null) {
      myFavorites = allProducts
          .where((product) => currentUser!.favoriteIds.contains(product.id))
          .toList();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'FAVORITES',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: myFavorites.isEmpty
          ? const Center(
              child: Text(
                'No favorites yet.',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: myFavorites.length,
              itemBuilder: (context, index) {
                final item = myFavorites[index];
                return ListTile(
                  leading: (item.image != null && item.image!.isNotEmpty)
                      ? Image.network(
                          item.image!,
                          width: 50,
                          fit: BoxFit.contain,
                        )
                      : const Icon(Icons.image),
                  title: Text(item.name ?? ''),
                  subtitle: Text(item.price ?? ''),
                  trailing: IconButton(
                    icon: const Icon(Icons.favorite, color: Colors.red),
                    onPressed: () async {
                      if (currentUser != null && item.id != null) {
                        setState(() {
                          currentUser!.favoriteIds.remove(item.id);
                        });
                        await saveUsersToStorage();
                      }
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(product: item),
                      ),
                    ).then((_) => setState(() {}));
                  },
                );
              },
            ),
    );
  }
}
