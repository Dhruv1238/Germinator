import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Plant {
  final String name;
  final String wateringTime;
  final String imageUrl;

  Plant(this.name, this.wateringTime, this.imageUrl);
}

class PlantPage extends StatefulWidget {
  @override
  _PlantPageState createState() => _PlantPageState();
}

class _PlantPageState extends State<PlantPage> {
  List<Plant> plants = [
    Plant('Rose', 'Every 7 days', 'https://i.ibb.co/DQKLhW3/plant2.png'),
    Plant('Cactus', 'Every 14 days', 'https://i.ibb.co/KGy3thF/plan1.png'),
  ];

  void addPlant() {
    setState(() {
      plants.add(Plant(
          'New Plant', 'Every 7 days', 'https://i.ibb.co/DQKLhW3/plant2.png'));
    });
  }

  Future<void> _logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/login',
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Plants'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: _logout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: plants.length,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.lightGreen[100],
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                leading: Image.network(plants[index].imageUrl),
                title: Text(
                  plants[index].name,
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Watering Time: ${plants[index].wateringTime}',
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: addPlant,
        onPressed: () {
          Navigator.pushNamed(context, '/plantcare');
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
