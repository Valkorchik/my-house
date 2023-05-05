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
      final isRequstedSnapshot = await ref.child('estates/$i/isRequsted').get();
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

  Future<void> getMyEstates() async {}

  Future<void> buyEstate() async {}

  final List<EstateRepository> _items = [];

  List<EstateRepository> get items {
    return [..._items];
  }

  EstateRepository findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }
}
