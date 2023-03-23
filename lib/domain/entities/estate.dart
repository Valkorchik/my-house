// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

class Estate extends Equatable {
  final String id;
  final String name;
  final String size;
  final String price;
  final String description;
  final String town;
  // final String image; TODO: Implementation with images

  const Estate(
      {required this.town,
      required this.id,
      required this.name,
      required this.size,
      required this.price,
      required this.description});

  @override
  List<Object?> get props => [name, size, price, description, id];
}

class EstateList {
  final List<Estate> _items = [
    const Estate(
      id: 'e1',
      name: 'Flat',
      size: '122',
      price: '10',
      description: 'Small pretty flat',
      town: 'г. Москва',
    ),
    const Estate(
        id: 'e2',
        name: 'House',
        size: '1220',
        price: '100',
        description: 'Big king house',
        town: 'г. Нью Йорк'),
    const Estate(
        id: 'e3',
        name: 'Mansion',
        size: '270',
        price: '176',
        description: 'Beautifull mansion',
        town: 'г. Осло'),
  ];

  List<Estate> get items {
    return [..._items];
  }

  Estate findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }
}
