import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:first_app/quiz.dart';
import 'package:first_app/models/user.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  Future<List<User>> fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      // Jika server mengembalikan response 200 OK, maka parse JSON
      List<dynamic> data = json.decode(response.body);
      return data.map((userJson) => User.fromJson(userJson)).toList();
    } else {
      // Jika response gagal
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'MUHAMMAD ZAINAL ILMI',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          const Text(
            '2210010415import 'dart:developer' as dart_dev;

dart_dev.log('Profile widget initialized');

Future<List<User>> fetchUsers() async {
  dart_dev.log('Fetching users...');
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  if (response.statusCode == 200) {
    dart_dev.log('Users fetched successfully');
    // Jika server mengembalikan response 200 OK, maka parse JSON
    List<dynamic> data = json.decode(response.body);
    return data.map((userJson) => User.fromJson(userJson)).toList();
  } else {
    dart_dev.log('Failed to fetch users');
    // Jika response gagal
    throw Exception('Failed to load users');
  }
}

@override
Widget build(context) {
  dart_dev.log('Building Profile widget...');
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'MUHAMMAD ZAINAL ILMI',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        const Text(
          '2210010415',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        Expanded(
          child: FutureBuilder<List<User>>(
            future: fetchUsers(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                dart_dev.log('Waiting for users to load...');
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                dart_dev.log('Error loading users: ${snapshot.error}');
                return const Center(child: Text('Error loading users.'));
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                dart_dev.log('Users loaded successfully');
                final users = snapshot.data!;
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return ListTile(
                      title: Text(
                        user.name,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        user.username,
                        style: const TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                      trailing: Text(
                        user.email,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    );
                  },
                );
              } else {
                dart_dev.log('No users found');
                return const Center(child: Text('No users found.'));
              }
            },
          ),
        ),
      ],
    ),
  );
}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          Expanded(
            child: FutureBuilder<List<User>>(
              future: fetchUsers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Error loading users.'));
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  final users = snapshot.data!;
                  return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return ListTile(
                        title: Text(
                          user.name,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          user.username,
                          style: const TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                        trailing: Text(
                          user.email,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text('No users found.'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
