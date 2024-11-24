import 'package:flutter/material.dart';

import '../../data/models/occasion_response/occasion_detail_response.dart';

class OccasionContent extends StatelessWidget {
  final List<Occasion> occasions;

  const OccasionContent(this.occasions, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // Top section: List of occasions
      SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: occasions.length,
          itemBuilder: (context, index) {
            final occasion = occasions[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                occasion.name ?? 'Unknown',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            );
          },
        ),
      ),
    ]);
  }
}
