import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'posts.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PostProvider(),
      child: MaterialApp(
        title: 'Post App',
        home: PostListScreen(),
      ),
    ),
  );
}

class PostProvider extends ChangeNotifier {
  List<Post> _posts = [];

  List<Post> get posts => _posts;

  Future<void> fetchPosts() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> parsed = json.decode(response.body);
      _posts = parsed.map((json) => Post.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}


class PostListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Posts',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 159, 33, 243),
      ),
      body: Column(
        children: [
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              postProvider.fetchPosts();
            },
            child: Text(
              'Fetch Posts',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 159, 33, 243),
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            ),
          ),
          SizedBox(height: 20.0),
          Expanded(
            child: ListView.builder(
              itemCount: postProvider.posts.length,
              itemBuilder: (context, index) {
                final post = postProvider.posts[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: index % 2 == 0 ? Colors.grey[200] : Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'User ID: ${post.userId.toString()}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('ID: ${post.id.toString()}'),
                      Text('Title: ${post.title}'),
                      Text('Body: ${post.body}'),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
