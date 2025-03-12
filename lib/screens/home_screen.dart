import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:space_rocks/models/rocket_model.dart';
import 'package:space_rocks/screens/rocket_details_screen.dart';
import 'package:space_rocks/services/api_services.dart';

class RocketListScreen extends StatefulWidget {
  const RocketListScreen({super.key});

  @override
  State createState() => _RocketListScreenState();
}

class _RocketListScreenState extends State<RocketListScreen> {
  late Future<RocketList> _rocketsFuture;

  @override
  void initState() {
    super.initState();
    _rocketsFuture = fetchRockets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rockets Explorer',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueGrey[800],
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blueGrey[800]!, Colors.blueGrey[600]!],
          ),
        ),
        child: FutureBuilder<RocketList>(
          future: _rocketsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Error: ${snapshot.error}',
                  style: const TextStyle(color: Colors.white),
                ),
              );
            } else if (!snapshot.hasData || snapshot.data!.rockets.isEmpty) {
              return const Center(
                child: Text(
                  'No rockets found',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }

            final rockets = snapshot.data!.rockets;

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: rockets.length,
              itemBuilder: (context, index) {
                final rocket = rockets[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RocketDetailScreen(rocket: rocket),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                          child: CachedNetworkImage(
                            imageUrl: rocket.flickrImages.isNotEmpty ? rocket.flickrImages.first : '',
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const Center(
                              child: SizedBox(
                                height: 50,
                                width: 50,
                                child: CircularProgressIndicator(),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              height: 200,
                              color: Colors.grey[300],
                              child: const Icon(Icons.rocket_launch, size: 50),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                rocket.name,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(Icons.flag, size: 16, color: Colors.grey),
                                  const SizedBox(width: 8),
                                  Text('Country: ${rocket.country}'),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.engineering, size: 16, color: Colors.grey),
                                  const SizedBox(width: 8),
                                  Text('Engines: ${rocket.engines.number}'),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey[100],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.arrow_forward, size: 16),
                                    SizedBox(width: 4),
                                    Text('View details'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}