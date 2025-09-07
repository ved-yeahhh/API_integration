import 'package:flutter/material.dart';
import 'package:project02/service_api.dart';

class PostPage extends StatelessWidget {
  PostPage({super.key});
  final ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post Page')),
      body: FutureBuilder(
        future: apiService.fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final posts = snapshot.data!;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(posts[index].title),
              subtitle: Text(posts[index].body),
            ),
          );
        },
      ),
    );
  }
}
