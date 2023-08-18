import 'package:flutter/material.dart';
import 'package:simpsons_character_viewer/infrastructure/models/related_topic_model.dart';

class ItemHomeList extends StatelessWidget {
  final RelatedTopicModel data;
  final VoidCallback onPressed;
  final bool selected;

  const ItemHomeList({
    Key? key,
    required this.data,
    required this.onPressed,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (data.text?.isNotEmpty ?? false) {
      return ListTile(
        onTap: onPressed,
        selected: selected,
        selectedColor: Colors.deepPurple,
        title: Text(data.title),
      );
    }

    return const SizedBox.shrink();
  }
}
