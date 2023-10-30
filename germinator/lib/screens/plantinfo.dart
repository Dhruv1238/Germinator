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
      imageUrl: 'https://example.com/snake_plant_image.jpg',
    ),
    PlantCard(
      plantName: 'Fiddle Leaf Fig',
      description:
          'The fiddle leaf fig is a trendy houseplant known for its large, glossy leaves and elegant appearance.',
      imageUrl: 'https://example.com/fiddle_leaf_fig_image.jpg',
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
                    // Add your logic for the 'Add' button here
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
