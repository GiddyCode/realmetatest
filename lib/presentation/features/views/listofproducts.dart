import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realmetatest/core/services/auth_services.dart';

import '../../../core/models/product_response.dart';

class ListOfProducts extends ConsumerStatefulWidget {
  const ListOfProducts({super.key});

  @override
  ConsumerState createState() => _ListOfProductsState();
}

class _ListOfProductsState extends ConsumerState<ListOfProducts> {
  Future<List<MyItem>> fetchData() async {

    AuthService _authService = AuthService();
    List<ProductResponse> products = await _authService.listOfProduct();

    return List.generate(
      products.length, (index) => MyItem(
        icon: products[index].image != null ? ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.network(products[index].image!),
        ) : Icon(Icons.supervised_user_circle_outlined) ,
        title: 'Item $index',
        subtitle: 'Subtitle $index',
        actionText: 'Action $index',
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<MyItem>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final item = snapshot.data?[index];
                return ListTile(
                  leading: item?.icon,
                  title: Text(item!.title),
                  subtitle: Text(item.subtitle),
                  trailing: Text(item.actionText),
                  onTap: () {
                   //get product list
                  },
                );
              },
            );
          }
        },
      )
    );
  }
}



class MyItem {
  final Widget icon;
  final String title;
  final String subtitle;
  final String actionText;

  MyItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.actionText,
  });
}