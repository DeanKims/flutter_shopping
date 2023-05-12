import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  final String id;
  final String name;
  final int price;
  final String imageUrl;

  Item({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  // Firebase(Document) => Flutter(Item)
  factory Item.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Item(
      id: snapshot.id,
      name: data['name'],
      price: data['price'],
      imageUrl: data['imageUrl'],
    );
  }

  // Flutter(Item) => Firebase(Document) (Map)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
    };
  }
}
