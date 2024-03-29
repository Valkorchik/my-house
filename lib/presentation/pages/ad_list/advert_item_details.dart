import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/estate/estate_bloc.dart';

class AdvertItemDetails extends StatelessWidget {
  final String itemId;
  const AdvertItemDetails({super.key, required this.itemId});

  @override
  Widget build(BuildContext context) {
    final estate = context.read<EstateBloc>();
    final loadedEstate = estate.estateRepository.findById(itemId);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(loadedEstate.name!),
              background: Hero(
                tag: itemId,
                child: Image.network(
                  loadedEstate.image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 10),
                Text(
                  '${loadedEstate.price} млн. руб',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: Text(
                    loadedEstate.description!,
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      estate.add(
                        BuyEstateEvent(itemId),
                      );
                    },
                    child: const Text("Купить дом")),
                const SizedBox(
                  height: 700,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
