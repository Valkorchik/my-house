import 'package:flutter/material.dart';

class AdvertsListItem extends StatelessWidget {
  const AdvertsListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      margin: const EdgeInsets.all(12),
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: GestureDetector(
            child: const Image(
              image: NetworkImage(
                  'https://i.pinimg.com/originals/af/f2/a0/aff2a08c328c7eca482777caa7bab95d.jpg'),
            ),
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [Text("AdTitle"), Text("AdCategories"), Text('Info')],
        ),
      ]),
    );
  }
}
