import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_house/presentation/pages/ad_list/adverts_list_item.dart';
import 'package:my_house/presentation/routes/router.gr.dart';
import 'package:my_house/presentation/widgets/app_drawer.dart';
import '../../bloc/estate/estate_bloc.dart';

class AdvertsListPage extends StatefulWidget {
  const AdvertsListPage({super.key});

  @override
  State<AdvertsListPage> createState() => _AdvertsListPageState();
}

class _AdvertsListPageState extends State<AdvertsListPage> {
  @override
  void initState() {
    context.read<EstateBloc>().add(GetEstatesEvent());
    super.initState();
  }

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
          if (state is EstateLoaded) {
            return ListView.builder(
              itemBuilder: (ctx, index) {
                return AdvertsListItem(
                  id: estate.estateRepository.items[index].id!,
                  name: estate.estateRepository.items[index].name!,
                  price: estate.estateRepository.items[index].price!,
                  size: estate.estateRepository.items[index].size!,
                  town: estate.estateRepository.items[index].town!,
                  image: estate.estateRepository.items[index].image!,
                );
              },
              itemCount: 8,
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
