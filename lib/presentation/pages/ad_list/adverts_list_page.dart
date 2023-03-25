import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_house/presentation/pages/ad_list/adverts_list_item.dart';
import 'package:my_house/presentation/routes/router.gr.dart';
import 'package:my_house/presentation/widgets/app_drawer.dart';
import '../../bloc/estate/estate_bloc.dart';

class AdvertsListPage extends StatelessWidget {
  const AdvertsListPage({super.key});
//TODO: https://pub.dev/packages/drop_down_list Search
  @override
  Widget build(BuildContext context) {
    final estate = context.read<EstateBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Объявления'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: IconButton(
              icon: const Icon(Icons.person),
              onPressed: () => context.router.replace(const UserRoute()),
            ),
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: BlocBuilder<EstateBloc, EstateState>(
        builder: (context, state) {
          estate.add(GetEstatesEvent());
          if (state is EstateLoaded) {
            return ListView.builder(
              itemBuilder: (ctx, index) {
                return AdvertsListItem(
                  id: estate.estateList.items[index].id,
                  name: estate.estateList.items[index].name,
                  price: estate.estateList.items[index].price,
                  size: estate.estateList.items[index].size,
                  town: estate.estateList.items[index].town,
                );
              },
              itemCount: estate.estateList.items.length,
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
