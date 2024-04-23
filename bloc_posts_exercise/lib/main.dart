import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'posts.dart';

class PostBloc extends Cubit<List<Post>> {
  PostBloc() : super([]);

  Future<void> fetchPosts() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> parsed = json.decode(response.body);
      emit(parsed.map((json) => Post.fromJson(json)).toList());
    } else {
      throw Exception('Failed to load posts');
    }
  }
}

void main() {
  runApp(
    BlocProvider(
      create: (context) => PostBloc(),
      child: MaterialApp(
        title: 'Post App',
        home: PostListScreen(),
      ),
    ),
  );
}

class PostListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postBloc = BlocProvider.of<PostBloc>(context);

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
      body: BlocBuilder<PostBloc, List<Post>>(
        builder: (context, posts) {
          return Column(
            children: [
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  postBloc.fetchPosts();
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
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
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
          );
        },
      ),
    );
  }
}
