import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/estate/estate_bloc.dart';

class AdvertItemDetails extends StatelessWidget {
  final String itemId;
  const AdvertItemDetails({super.key, required this.itemId});

  @override
  Widget build(BuildContext context) {
    final estate = context.read<EstateBloc>();
    final loadedEstate = estate.estateList.findById(itemId);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(loadedEstate.name),
              background: Hero(
                tag: itemId,
                child: Image.network(
                  'https://i.pinimg.com/originals/af/f2/a0/aff2a08c328c7eca482777caa7bab95d.jpg',
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
                    loadedEstate.description,
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ),
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
