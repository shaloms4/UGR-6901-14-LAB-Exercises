import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_posts_exercise/posts.dart';
void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'riverpod_posts_exercise',
        home: PostListScreen(),
      ),
    ),
  );
}
final postProvider = FutureProvider<List<Post>>((ref) async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  if (response.statusCode == 200) {
    final List<dynamic> parsed = json.decode(response.body);
    return parsed.map((json) => Post.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load posts');
  }
});

class ButtonPressNotifier extends StateNotifier<bool> {
  ButtonPressNotifier() : super(false);

  void setButtonPressed(bool value) {
    state = value;
  }
}

final buttonPressProvider = StateNotifierProvider<ButtonPressNotifier, bool>((ref) {
  return ButtonPressNotifier();
});

class PostListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final isButtonPressed = ref.watch(buttonPressProvider);

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
         
          Center(
            child: ElevatedButton(
              onPressed: () {
               
                ref.read(buttonPressProvider.notifier).setButtonPressed(true);
                ref.refresh(postProvider);
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
          ),
          SizedBox(height: 20.0),
          
          if (isButtonPressed)
            Consumer(builder: (context, ref, _) {
              final postsAsync = ref.watch(postProvider);
              return postsAsync.when(
                loading: () => CircularProgressIndicator(),
                error: (error, stackTrace) => Text('Error: $error'),
                data: (posts) {
                  if (posts.isEmpty) {
                    return Text('No posts available.');
                  } else {
                    return Expanded(
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
                    );
                  }
                },
              );
            }),
        ],
      ),
    );
  }
}
