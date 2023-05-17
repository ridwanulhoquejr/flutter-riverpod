import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:riverpod_tutorial/model/post_model.dart';
import 'package:http/http.dart' as http;

class PostFromAPI extends StatefulWidget {
  const PostFromAPI({super.key});

  @override
  State<PostFromAPI> createState() => _PostFromAPI();
}

class _PostFromAPI extends State<PostFromAPI> {
  List<SamplePosts> posts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post From API'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
            future: getPostFromAPI(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        height: 180,
                        width: double.infinity,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Post Id: ${posts[index].id}'),
                            Text('Post Title: ${posts[index].title}'),
                            Text('Post Description: ${posts[index].body}'),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  Future<List<SamplePosts>> getPostFromAPI() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );
    final data = jsonDecode(response.body); //? it will convert json to map

    // then we have to loop through the map to get the single post/object
    if (response.statusCode == 200) {
      for (Map<String, dynamic> post in data) {
        posts.add(SamplePosts.fromJson(post));
      }
      return posts;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
