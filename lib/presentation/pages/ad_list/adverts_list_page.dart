import 'package:flutter/material.dart';
import 'package:my_house/presentation/pages/ad_list/adverts_list_item.dart';
import 'package:my_house/presentation/widgets/app_drawer.dart';

class AdvertsListPage extends StatelessWidget {
  const AdvertsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мой дом'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemBuilder: (ctx, index) => const AdvertsListItem(),
        itemCount: 10,
      ),
    );
  }
}
