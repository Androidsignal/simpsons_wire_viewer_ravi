import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:simpsons_character_viewer/infrastructure/models/related_topic_model.dart';

class DetailsScreen extends StatelessWidget {
  final RelatedTopicModel data;

  const DetailsScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(data.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ExtendedImage.network(
              data.imageUrl,
              height: 200,
              loadStateChanged: (ExtendedImageState state) {
                if (state.extendedImageLoadState == LoadState.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.extendedImageLoadState == LoadState.failed) {
                  return const Icon(Icons.broken_image_rounded,
                      color: Colors.grey, size: 150);
                }
                return null;
              },
            ),
            const SizedBox(height: 50),
            Text(
              data.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            const Text('Description: ',
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                    fontStyle: FontStyle.italic)),
            const SizedBox(height: 5),
            Text(data.description),
          ],
        ),
      ),
    );
  }
}
