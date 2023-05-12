import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping/models/item.dart';

class HomeScreen extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('쇼핑몰'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('item').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error!!'),
            );
          }
          if (snapshot.hasData == false) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<Item> items =
              snapshot.data!.docs.map((doc) => Item.fromSnapshot(doc)).toList();

          return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                Item item = items[index];
                return ListTile(
                  leading: Image.network(item.imageUrl),
                  title: Text(item.name),
                  subtitle: Text('${item.price}원'),
                );
              });
        },
      ),
    );
  }
}
