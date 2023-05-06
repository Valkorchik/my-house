import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_house/presentation/routes/router.gr.dart';

class MyAdvertsListItem extends StatelessWidget {
  final String id;
  final String name;
  final String size;
  final String price;
  final String town;
  final String image;
  const MyAdvertsListItem({
    super.key,
    required this.name,
    required this.town,
    required this.size,
    required this.price,
    required this.id,
    required this.image,
  });

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
            onTap: () {
              context.router.push(AdvertItemDetails(itemId: id));
            },
            child: Hero(
              tag: id,
              child: FadeInImage(
                placeholder:
                    const AssetImage('assets/images/image-placeholder.png'),
                image: NetworkImage(image),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                name,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              Text(
                '$sizeм2',
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              Text(
                '$price млн. руб.',
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              Text(
                town,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
