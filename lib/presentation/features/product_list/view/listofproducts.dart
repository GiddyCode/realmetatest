import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realmetatest/core/services/auth_services.dart';
import 'package:realmetatest/presentation/features/product_details/view/product_details.dart';
import 'package:realmetatest/presentation/features/product_list/view/product_item.dart';
import 'package:realmetatest/utils/utils.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/models/product_response.dart';
import '../viewmodel/list_of_product_vm.dart';

class ListOfProducts extends ConsumerStatefulWidget {
  const ListOfProducts({super.key});

  @override
  ConsumerState createState() => _ListOfProductsState();
}

class _ListOfProductsState extends ConsumerState<ListOfProducts> {

  @override
  Widget build(BuildContext context) {
    final ListOfProductVM = ref.watch(ListOfProductsVMState.notifier);
    return Scaffold(
      body: FutureBuilder<List<MyItem>>(
        future: ListOfProductVM.fetchData(),
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
                  title: Text(item!.title, overflow: TextOverflow.ellipsis,),
                  subtitle: Text(item.subtitle, maxLines: 1, overflow: TextOverflow.ellipsis,),
                  trailing: Text(item.actionText, ),
                  onTap: () {
                   context.push(ProductDetails(productIndex: index+1,));
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