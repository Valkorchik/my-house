import 'package:firebase_database/firebase_database.dart';

class EstateRepository {
  String? id;
  String? name;
  String? size;
  String? price;
  String? description;
  String? town;
  String? image;
  bool? isRequsted;

  EstateRepository({
    this.isRequsted,
    this.town,
    this.id,
    this.name,
    this.size,
    this.price,
    this.description,
    this.image,
  });

  Future<void> getEstate() async {
    for (int i = 0; i < 8; i++) {
      final ref = FirebaseDatabase.instance.ref();
      final townSnapshot = await ref.child('estates/$i/town').get();
      final idSnapshot = await ref.child('estates/$i/id').get();
      final nameSnapshot = await ref.child('estates/$i/name').get();
      final isRequstedSnapshot =
          await ref.child('estates/$i/isRequested').get();
      final sizeSnapshot = await ref.child('estates/$i/size').get();
      final priceSnapshot = await ref.child('estates/$i/price').get();
      final descriptionSnapshot =
          await ref.child('estates/$i/description').get();
      final imageSnapshot = await ref.child('estates/$i/image').get();

      town = townSnapshot.value.toString();
      id = idSnapshot.value.toString();
      name = nameSnapshot.value.toString();
      isRequsted = isRequstedSnapshot.value as bool?;
      size = sizeSnapshot.value.toString();
      price = priceSnapshot.value.toString();
      description = descriptionSnapshot.value.toString();
      id = idSnapshot.value.toString();
      image = imageSnapshot.value.toString();
      _items.add(EstateRepository(
          isRequsted: isRequsted,
          town: town,
          id: id,
          name: name,
          size: size,
          price: price,
          description: description,
          image: image));
    }
  }

  Future<void> getMyEstates() async {
    if (_items.isEmpty) {
      await getEstate();
    }
    for (int i = 0; i < _items.length; i++) {
      if (_items[i].isRequsted == true) {
        _itemsMy.add(EstateRepository(
            isRequsted: _items[i].isRequsted,
            town: _items[i].town,
            id: _items[i].id,
            name: _items[i].name,
            size: _items[i].size,
            price: _items[i].price,
            description: _items[i].description,
            image: _items[i].image));
      }
    }
  }

  Future<void> buyEstate(String estateId) async {
    EstateRepository item = findById(estateId);
    item.isRequsted = true;
    final ref = FirebaseDatabase.instance.ref();

    final Map<String, Map> updates = {};
    final postData = {
      'description': item.description,
      'id': item.id,
      'image': item.image,
      'isRequested': item.isRequsted,
      'name': item.name,
      'price': item.price,
      'size': item.size,
      'town': item.town,
    };
    _itemsMy.add(EstateRepository(
        isRequsted: item.isRequsted,
        town: item.town,
        id: item.id,
        name: item.name,
        size: item.size,
        price: item.price,
        description: item.description,
        image: item.image));

    updates['estates/$estateId'] = postData;
    ref.update(updates);
  }

  void clearList() {
    _itemsMy.clear();
  }

  final List<EstateRepository> _items = [];

  // ignore: prefer_final_fields
  List<EstateRepository> _itemsMy = [];

  List<EstateRepository> get items {
    return [..._items];
  }

  List<EstateRepository> get itemsMy {
    return [..._itemsMy];
  }

  EstateRepository findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  EstateRepository findByIdMy(String id) {
    return _itemsMy.firstWhere((element) => element.id == id);
  }
}
