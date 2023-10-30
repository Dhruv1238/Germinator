import 'package:flutter/material.dart';

class Plant {
  final String name;
  final String wateringTime;
  final String imageUrl;

  Plant(this.name, this.wateringTime, this.imageUrl);
}

class UserProfilePage extends StatelessWidget {
  final String name;
  final int age;
  final List<Plant> plants;

  UserProfilePage({
    required this.name,
    required this.age,
    required this.plants,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: $name',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Age: $age',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Plants:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: plants.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Image.network(plants[index].imageUrl),
                      title: Text(plants[index].name),
                      subtitle:
                          Text('Watering Time: ${plants[index].wateringTime}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
