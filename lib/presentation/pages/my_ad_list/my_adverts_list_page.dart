import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_house/presentation/routes/router.gr.dart';
import 'package:my_house/presentation/widgets/app_drawer.dart';
import '../../bloc/estate/estate_bloc.dart';
import 'my_adverts_list_item.dart';

class MyAdvertsListPage extends StatefulWidget {
  const MyAdvertsListPage({super.key});

  @override
  State<MyAdvertsListPage> createState() => _MyAdvertsListPageState();
}

class _MyAdvertsListPageState extends State<MyAdvertsListPage> {
  @override
  void initState() {
    BlocProvider.of<EstateBloc>(context, listen: false).add(GetMyEventsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final estate = context.read<EstateBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Моя Недвижимость'),
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
                return MyAdvertsListItem(
                  id: estate.estateRepository.itemsMy[index].id!,
                  name: estate.estateRepository.itemsMy[index].name!,
                  price: estate.estateRepository.itemsMy[index].price!,
                  size: estate.estateRepository.itemsMy[index].size!,
                  town: estate.estateRepository.itemsMy[index].town!,
                  image: estate.estateRepository.itemsMy[index].image!,
                );
              },
              itemCount: estate.estateRepository.itemsMy.length,
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
