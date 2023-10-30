import 'package:flutter/material.dart';

class PlantCarePage extends StatefulWidget {
  @override
  _PlantCarePageState createState() => _PlantCarePageState();
}

class _PlantCarePageState extends State<PlantCarePage> {
  TextEditingController searchController = TextEditingController();
  List<PlantCard> plants = [
    PlantCard(
      plantName: 'Snake Plant',
      description:
          'The snake plant is a popular indoor plant known for its hardiness and air purifying qualities.',
      imageUrl: 'https://i.ibb.co/KGy3thF/plan2.png',
    ),
    PlantCard(
      plantName: 'Fiddle Leaf Fig',
      description:
          'The fiddle leaf fig is a trendy houseplant known for its large, glossy leaves and elegant appearance.',
      imageUrl: 'https://i.ibb.co/DQKLhW3/plant1.png',
    ),
  ];

  List<PlantCard> filteredPlants = [];

  @override
  void initState() {
    super.initState();
    filteredPlants = List.from(plants);
  }

  void filterPlants(String query) {
    setState(() {
      filteredPlants = plants
          .where((plant) =>
              plant.plantName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plant Care'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search Plants',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: filterPlants,
            ),
            SizedBox(height: 20),
            ...filteredPlants,
          ],
        ),
      ),
    );
  }
}

class PlantCard extends StatelessWidget {
  final String plantName;
  final String description;
  final String imageUrl;

  PlantCard({
    required this.plantName,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        children: [
          Image.network(
            imageUrl,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plantName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/plant2');
                  },
                  child: Text('Add'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(fontSize: 20),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
