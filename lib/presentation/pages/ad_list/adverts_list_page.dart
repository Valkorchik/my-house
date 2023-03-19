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
        actions: const [Icon(Icons.verified_user)],
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemBuilder: (ctx, index) => const AdvertsListItem(),
        itemCount: 10,
      ),
    );
  }
}
